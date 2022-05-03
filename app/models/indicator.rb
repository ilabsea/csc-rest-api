# frozen_string_literal: true

# == Schema Information
#
# Table name: indicators
#
#  id                 :bigint           not null, primary key
#  categorizable_id   :integer
#  categorizable_type :string
#  name               :string
#  tag_id             :integer
#  display_order      :integer
#  image              :string
#  uuid               :string
#  audio              :string
#  type               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Indicator < CscCore::ApplicationRecord
  self.table_name = "indicators"

  include CscCore::Tagable

  # Constant
  TYPES = %w[Indicators::PredefineIndicator Indicators::CustomIndicator].freeze

  # Association
  belongs_to :categorizable, polymorphic: true, touch: true
  has_many :languages_indicators, class_name: 'CscCore::LanguagesIndicator', dependent: :destroy
  has_many :languages, through: :languages_indicators

  has_many :raised_indicators, foreign_key: :indicator_uuid, primary_key: :uuid
  has_many :voting_indicators, foreign_key: :indicator_uuid, primary_key: :uuid

  # Validation
  validates :name, presence: true
  validates :name, uniqueness: { scope: %i[categorizable_id categorizable_type] }, unless: lambda {
                                                                                             type == "CscCore::Indicators::CustomIndicator"
                                                                                           }
  validate :image_size_validation

  # Callback
  before_validation :set_type
  before_create :set_display_order
  before_create :secure_uuid

  # Scope
  default_scope { order(display_order: :asc) }
  scope :customs, -> { where(type: "Indicators::CustomIndicator") }
  scope :predefines, -> { where(type: "Indicators::PredefineIndicator") }

  # Nested Attributes
  accepts_nested_attributes_for :languages_indicators, allow_destroy: true, reject_if: lambda { |attributes|
    attributes["audio"] = nil if attributes["remove_audio"] == "1"
    return attributes["id"].blank? && attributes["content"].blank? && attributes["audio"].blank?
  }

  # Uploader
  mount_uploader :image, CscCore::ImageUploader

  def image_or_default
    image_url || "default_image.png"
  end

  def editable_tag?
    raised_indicators.blank?
  end

  def custom?
    type == "Indicators::CustomIndicator"
  end

  # Class methods
  def self.filter(params)
    scope = all
    scope = scope.where("LOWER(name) LIKE ?", "%#{params[:name].downcase}%") if params[:name].present?
    if params[:facility_id].present?
      scope = scope.where(categorizable_id: params[:facility_id],
                          categorizable_type: "CscCore::Facility")
    end
    scope
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        CscCore::Indicator.model_name
      end
    end
    super
  end

  # Class Methods
  def self.types
    TYPES
  end

  private
    def set_display_order
      self.display_order ||= categorizable.present? && categorizable.indicators.maximum(:display_order).to_i + 1
    end

    def image_size_validation
      errors[:image] << I18n.t("indicator.must_be_less_than_1mb") if image.size > 1.megabytes
    end

    def set_type
      self.type ||= TYPES.first
    end
end

class Mosque < ApplicationRecord
  include TranslateEnum

  has_many :donations, inverse_of: :mosque, dependent: :destroy
  has_one_attached :cover_image

  accepts_nested_attributes_for :donations, allow_destroy: true,
    reject_if: proc { |attrs| attrs["title"].blank? }

  validates :name, presence: true
  validates :description, presence: true

  enum :status, { active: 0, inactive: 1 }
  enum :size, { small: 0, medium: 1, large: 2 }
  enum :city, { aleppo: 0, damascus: 1 }

  translate_enum :size
  translate_enum :city

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "city", "size" ]
  end
end

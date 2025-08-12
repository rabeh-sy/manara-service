class Mosque < ApplicationRecord
  include TranslateEnum

  has_many :donations, inverse_of: :mosque, dependent: :destroy

  accepts_nested_attributes_for :donations, allow_destroy: true

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

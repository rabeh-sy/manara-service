class Mosque < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  enum :status, { active: 0, inactive: 1 }
  enum :size, { small: 0, medium: 1, large: 2 }
end

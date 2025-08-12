class Donation < ApplicationRecord
  belongs_to :mosque, counter_cache: true
end

class Item < ApplicationRecord
  has_many :trip_items

  validates :name, presence: true
end

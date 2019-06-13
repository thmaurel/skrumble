class Item < ApplicationRecord
  belongs_to :country
  has_many :trip_items

  validates :name, presence: true
end

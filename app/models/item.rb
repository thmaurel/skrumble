class Item < ApplicationRecord
  has_many :tripitems

  validates :name, presence: true
end

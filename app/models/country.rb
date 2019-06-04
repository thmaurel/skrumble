class Country < ApplicationRecord
  has_many :trips
  has_many :tasks

  validates :name, presence: true, uniqueness: true
end

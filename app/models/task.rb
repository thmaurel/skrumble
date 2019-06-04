class Task < ApplicationRecord
  belongs_to :country
  has_many :todos

  validates :name, presence: true
end

class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :country
  has_many :tripitems
  has_many :todos

  validates :start_date, presence: true
  validates :end_date, presence: true
end

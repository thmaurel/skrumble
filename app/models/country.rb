class Country < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :trips
  has_many :tasks
  has_many :items
  has_many :events

  validates :name, presence: true, uniqueness: true
end

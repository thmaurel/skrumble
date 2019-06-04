class Country < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :trips
  has_many :tasks

  validates :name, presence: true, uniqueness: true
end

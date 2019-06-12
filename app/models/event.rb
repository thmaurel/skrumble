class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :trip_events

  validates :name, presence: true
  validates :start_date, presence: true
end

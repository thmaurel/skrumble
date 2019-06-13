class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :country
  has_many :trip_events

  validates :name, presence: true
  validates :start_date, presence: true
end

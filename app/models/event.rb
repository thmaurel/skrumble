class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :trip

  validates :name, presence: true
  validates :start_date, presence: true
end

class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :country
  has_many :trip_items
  has_many :todos

  validates :start_date, presence: true
  validates :end_date, presence: true

  after_create :create_tripitems

  private

  def create_tripitems
    Item.all.each do |item|
      t = TripItem.new()
      t.trip = self
      t.item = item
      t.quantity = (item.ratio * (self.end_date - self.start_date + 1)).to_i
      t.done = false
      t.save
    end
  end
end

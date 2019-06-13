class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :country
  has_many :trip_items, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :trip_events, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  after_create :create_tripitems
  after_create :create_todos
  after_create :create_tripevents

  def is_done?
    trip_items.count == trip_items.where(done: true).count
  end

  private

  def create_tripitems
    Item.all.each do |item|
      if item.country == self.country
        t = TripItem.new
        t.trip = self
        t.item = item
        t.quantity = (item.ratio * (self.end_date - self.start_date + 1)).to_i + 1
        t.done = false
        t.save
      end
    end
  end

  def create_todos
    Task.all.each do |task|
      if task.country_id == self.country_id
        todo = Todo.new
        todo.trip = self
        todo.task = task
        todo.done = false
        todo.save
      end
    end
  end

  def create_tripevents
    Event.all.each do |event|
      if event.country == self.country
        e = TripEvent.new
        e.trip = self
        e.event = event
        e.save
      end
    end
  end

end

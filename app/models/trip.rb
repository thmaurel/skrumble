class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :country
  has_many :trip_items
  has_many :todos
  has_many :events

  validates :start_date, presence: true
  validates :end_date, presence: true

  after_create :create_tripitems
  after_create :create_todos

  private

  def create_tripitems
    Item.all.each do |item|
      t = TripItem.new()
      t.trip = self
      t.item = item
      t.quantity = (item.ratio * (self.end_date - self.start_date + 1)).to_i + 1
      t.done = false
      t.save
    end
  end

  def create_todos
    Task.all.each do |task|
      if task.country_id == self.country_id
        todo = Todo.new()
        todo.trip = self
        todo.task = task
        todo.done = false
        todo.save
      end
    end
  end
end

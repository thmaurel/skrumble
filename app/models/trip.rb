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
  # after_create :create_events

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

  def create_events
    e = Event.new
    e.trip = self
    e.name = "Scuba diving"
    e.category = "Watersport"
    e.remote_photo_url = "https://nature-plongee.com/wp-content/uploads/voyage-plongee-saba-caraibes-m-j41.jpg"
    e.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, dicta ea excepturi cumque, corporis mollitia incidunt maxime consequatur distinctio dolore."
    e.start_date = "Fri, 24 May 2019"
    e.end_date = "Fri, 24 May 2019"
    e.save

    ev = Event.new
    ev.trip = self
    ev.name = "Forest walk"
    ev.category = "Outdoor activities"
    ev.remote_photo_url = "https://www.wedemain.fr/photo/art/grande/28623324-28127445.jpg?v=1544095128"
    ev.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, dicta ea excepturi cumque, corporis mollitia incidunt maxime consequatur distinctio dolore."
    ev.start_date = "Fri, 24 May 2019"
    ev.end_date = "Fri, 24 May 2019"
    ev.save

    eve = Event.new
    eve.trip = self
    eve.name = "Barbecue"
    eve.category = "Food"
    eve.remote_photo_url = "https://previews.123rf.com/images/innocent/innocent1003/innocent100300039/11710255-gros-plan-d-un-barbecue-d-%C3%A9t%C3%A9-.jpg"
    eve.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, dicta ea excepturi cumque, corporis mollitia incidunt maxime consequatur distinctio dolore."
    eve.start_date = "Fri, 24 May 2019"
    eve.end_date = "Fri, 24 May 2019"
    eve.save

    # even = Event.new
    # even.trip = self
    # even.name = "Big Party"
    # even.category = "Nightlife"
    # even.remote_photo_url = "https://mixmag.fr/assets/uploads/images/_columns2/FCKNYE-FESTIVAL-2017-%C2%A9-Axel-Pics.JPG"
    # even.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, dicta ea excepturi cumque, corporis mollitia incidunt maxime consequatur distinctio dolore."
    # even.start_date = "Fri, 24 May 2019"
    # even.end_date = "Fri, 24 May 2019"
    # even.save

  end
end

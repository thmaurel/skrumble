class Todo < ApplicationRecord
  belongs_to :trip
  belongs_to :task
end

class TodoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def mark_as_complete?
    record.trip.user == user
  end
end

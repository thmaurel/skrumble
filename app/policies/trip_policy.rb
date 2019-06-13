class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def create?
    return true
  end

  def share_new?
    share_create?
  end

  def share_create?
    true
  end
  def accept?
    true
  end
  def decline?
    true
  end
end

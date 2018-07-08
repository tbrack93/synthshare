class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def create?
    record.booking.user == user || record.booking.synth.user == user
  end

end

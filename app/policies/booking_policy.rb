class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user_is_owner? || record.synth.user == user
  end

  def create?
    record.synth.user == user ? false : user_is_owner?
  end

  def show?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def update?
    user_is_owner? || record.synth.user == user
  end

  def status?
    user_is_owner? || record.synth.user == user
  end

  def submit?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end

end

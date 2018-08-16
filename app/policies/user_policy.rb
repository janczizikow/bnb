class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    update?
  end

  def update?
    user.admin ? true : profile_owner?
  end

  def profile_owner?
    record.id == params[:id]
  end
end

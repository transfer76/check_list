class CheckListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.admin?

      scope.where(user: user)
    end
  end

  def show?
    user.admin? || record.user == user
  end

  def create?
    true
  end

  def update?
    show?
  end

  def destroy?
    user.admin? || record.user == user
  end
end

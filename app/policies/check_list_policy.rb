class CheckListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.admin?

      scope.where('user_id = ? OR published', user.id)
    end
  end

  def show?
    user.admin? || record.published? || record.user == user
  end

  def create?
    true
  end

  def publish?
    user.admin? || record.user == user
  end

  def update?
    show?
  end

  def destroy?
    publish?
  end
end

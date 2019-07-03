class FormPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.admin?
    end
  end

  def show?
    user.admin?
  end

  def create?
    user.admin? && !record.published?
  end

  def update?
   create?
  end

  def publish?
   create?
  end

  def destroy?
    create?
  end
end

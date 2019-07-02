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
    user.admin?
  end

  def update?
   user.admin?
  end

  def destroy?
    user.admin?
  end
  # 1.possible edit and delete form without checklists only
  # 2.only admin can perform actions on the form
end

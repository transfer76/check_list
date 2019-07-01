class FormQuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all #if user.admin?
    end
  end

  def create?
    true #user.admin?
  end

  def update?
    true #user.admin?
  end

  def destroy?
    true #user.admin?
  end
end

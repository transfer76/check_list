class FormQuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin? && !record.form.published?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end

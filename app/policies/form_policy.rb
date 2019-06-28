class FormPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    true
  end
  # 1.possible edit and delete form without checklists only
  # 2.only admin can perform actions on the form
end

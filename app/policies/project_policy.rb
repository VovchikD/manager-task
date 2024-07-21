# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  def add_teammate?
    user.admin?
  end

  def remove_teammate?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end

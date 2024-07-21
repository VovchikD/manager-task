# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def create?
    user.admin? && record.user == user
  end

  def add_teammate?
    user.admin? && record.user == user
  end

  def remove_teammate?
    user.admin? && record.user == user
  end

  def destroy?
    user.admin? && record.user == user
  end
end

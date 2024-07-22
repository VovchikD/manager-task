# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  def create?
    user.present? || user.admin?
  end

  def edit?
    user.present? && record.user == user || user.admin?
  end

  def destroy?
    user.present? && record.user == user || user.admin?
  end
end

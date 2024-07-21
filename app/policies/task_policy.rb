# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def edit?
    user.present? && record.user == user
  end

  def destroy?
    user.present? && record.user == user
  end
end

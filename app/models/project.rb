# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks
  has_many :teams
  has_many :users, through: :teams
end

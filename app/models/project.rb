# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  has_many :tasks
end

# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :projects, through: :teams
  has_many :teams

  enum role: { default: 0, admin: 1 }
end

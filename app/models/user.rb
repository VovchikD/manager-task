# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :teams
  has_many :projects, through: :teams
  has_many :tasks

  enum role: { default: 0, admin: 1 }
end

# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :validatable,
         :confirmable

  has_many :user_queries, dependent: :destroy
  has_many :queries, through: :user_queries
end

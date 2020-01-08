class User < ApplicationRecord
  has_many :courses
  has_many :statuses, through: :sessions
  has_many :questions, through: :sessions
  has_many :answers, through: :questions
end

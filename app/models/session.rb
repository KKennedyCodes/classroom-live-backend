class Session < ApplicationRecord
  belongs_to :course
  has_many :statuses
  has_many :questions
end

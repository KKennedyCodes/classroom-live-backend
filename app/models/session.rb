require "faker"

class Session < ApplicationRecord
  belongs_to :course
  has_many :statuses
  has_many :questions
  
  def create_codes
    @sessioncodes = []
    50.times do 
      @sessioncodes << Faker::Alphanumeric.unique.alphanumeric(number: 8)
    end
  end
  
  
end

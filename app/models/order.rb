class Order < ActiveRecord::Base
  validates :number, uniqueness: true
  before_create :set_number

  private

  def set_number
    while !self.number || Order.exists?(number: self.number.to_s)
      self.number = create_number
    end
  end

  def create_number
    (SecureRandom.random_number(9000000) + 1000000)
  end
end

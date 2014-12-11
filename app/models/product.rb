class Product < ActiveRecord::Base
  validates :name, :price_cents, :weight, presence: true
  validates :price_cents, :weight, numericality: {greater_than: 0}

  monetize :price_cents
end

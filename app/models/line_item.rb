class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  validates :product_id, :order_id, :quantity, presence: true
  monetize :total_cents

  before_save :update_total, if: :product

  def update_total
    self.total_cents = self.product.price_cents * self.quantity
  end
end

class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  validates :product_id, :order_id, :quantity, presence: true
  monetize :total_cents

  before_validation :update_total

  def update_total
    return unless product.present?
    self.total_cents = self.product.price_cents * self.quantity
  end

  def has_product?
    product_id || product
  end
end

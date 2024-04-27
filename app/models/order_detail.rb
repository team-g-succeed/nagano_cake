class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :item_id, :order_id, :amount, :price, presence: true
  validates :price, :amount, numericality: {only_integer: true}
  enum making_status: { disable: 0, waiting: 1, production: 2, complete: 3}
  
  def add_taxprice
  (self.tax_price * 1.10).round
  end
end

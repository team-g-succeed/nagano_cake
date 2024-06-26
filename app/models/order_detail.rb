class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :item_id, :order_id, :amount, :price, presence: true
  validates :price, :amount, numericality: {only_integer: true}
  enum making_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}
  
  def add_tax_items_price
    (self.price * 1.10).round
  end
end

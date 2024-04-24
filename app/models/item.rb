class Item < ApplicationRecord
  with_options presence: true do
    
    validates :name
    validates :introduction
    validates :price
    validates :image
  end
  has_one_attached :image
  has_many :cart_items
  
  def add_tax_items_price
    (self.price * 1.10).round
  end
end

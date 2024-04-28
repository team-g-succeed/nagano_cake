class Item < ApplicationRecord
  with_options presence: true do
    
    validates :name
    validates :introduction
    validates :price
    validates :genre_id
    
  end
  
  has_one_attached :image
  has_many :cart_items
  has_many :order_details, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :genre
  
  def add_tax_items_price
    (self.price * 1.10).round
  end
  
end

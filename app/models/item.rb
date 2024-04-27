class Item < ApplicationRecord
  with_options presence: true do
    
    validates :name
    validates :introduction
    validates :price
    validates :image
    validates :genre_id
  end
  has_one_attached :image
  has_many :cart_items
  belongs_to :genre
  
  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width,height]).processed
  end
  
  def add_tax_items_price
    (self.price * 1.10).round
  end
end

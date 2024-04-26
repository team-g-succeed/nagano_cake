class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  

  validates :item_id, uniqueness: { scope: :customer_id }

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width,height]).processed
  end

  def sum_of_price
    item.with_tax_price * amount
  end
end

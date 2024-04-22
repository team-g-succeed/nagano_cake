class Item < ApplicationRecord
  with_options presence: true do
    validates :genre_id
    validates :name
    validates :introduction
    validates :price
    validates :image
  end
  has_one_attached :image
end

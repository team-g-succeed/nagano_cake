class Customer < ApplicationRecord
  after_save :check_active_status
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :email
    validates :postal_code
    validates :address
    validates :telephone_number
  end  

  # def active_for_authentication?
  #   super && !is_deleted
  # end 
  
  def check_active_status
    if saved_change_to_is_active? && !is_active
      self.update(is_active: false)
    end 
  end 
  
  def full_name
    self.last_name + " " + self.first_name
  end
end

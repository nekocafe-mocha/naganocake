class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :family_name, :first_name, :address, :email, presence: true
  validates :phone, presence: true, format: { with:/\A\d{10}$|^\d{11}\z/}
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/}
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}

  has_many :deliveries, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  enum status: {有効:0, 退会:1}

  def full_info
    "#{self.postal_code} #{self.address}  #{self.family_name}#{self.first_name}"
  end

  def full_name
    self.family_name + self.first_name
  end
end

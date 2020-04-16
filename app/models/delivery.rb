class Delivery < ApplicationRecord
  validates :customer_id, :name, :address, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/}
  validates :phone, presence: true, format: { with:/\A\d{10}$|^\d{11}\z/}

  belongs_to :customer
end

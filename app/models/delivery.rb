class Delivery < ApplicationRecord
  validates :customer_id, :name, :address, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/}


  belongs_to :customer
end

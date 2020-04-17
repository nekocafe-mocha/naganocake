class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	has_many :items, though: :order_items
	belongs_to :customer

	validates　:customer_id, :name, :postal_code, :address, :phone, :postage, :total_price, :pay_select, :status, presence: true
end

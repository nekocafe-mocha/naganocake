class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :item

	validates :order_id, :item_id, :price, :quantity, :status, presence: true
end

class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :item

	validates :order_id, :item_id, :price, :quantity, :status, presence: true

	enum status: {着手不可:0, 製作待ち:1, 製作中:2, 製作完了:3}
end

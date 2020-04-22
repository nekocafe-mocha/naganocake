class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	has_many :items, through: :order_items
	belongs_to :customer

	validates :customer_id, :name, :postal_code, :address, :phone, :postage, :total_price, :pay_select, :status, presence: true

	enum pay_select: {クレジットカード: 0, 銀行振込: 1}
	enum status: {入金待ち:0, 入金確認:1, 制作中:2, 発送準備中:3, 発送済み:4}

	def full_info
    	self.postal_code + self.address + self.name
  	end
end

class Item < ApplicationRecord
	validates :name, :caption, :price, :image, :status, :category_id, presence: true

	belongs_to :category
	has_many :cart_items, dependent: :destroy
	has_many :order_items
	attachment :image
end

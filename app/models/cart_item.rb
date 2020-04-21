class CartItem < ApplicationRecord
	validates :quantity, :item_id, :customer_id, presence: true

    belongs_to :item
    belongs_to :customer, optional: true
end

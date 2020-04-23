class Delivery < ApplicationRecord
  validates :customer_id, :name, :address, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/}
  belongs_to :customer

  def full_info
  	"#{self.postal_code} #{self.address}  #{self.name}"
  end
end

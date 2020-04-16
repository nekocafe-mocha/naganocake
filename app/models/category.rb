class Category < ApplicationRecord
  validates :name, :status, presence: true

  has_many :items
end

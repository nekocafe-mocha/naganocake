class Category < ApplicationRecord
  validates :name, :status, presence: true

  has_many :items

  enum status: {有効:0, 無効:1}
end

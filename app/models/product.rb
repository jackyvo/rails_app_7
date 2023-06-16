class Product < ApplicationRecord
  belongs_to :brand

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
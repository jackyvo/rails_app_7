class Product < ApplicationRecord
  belongs_to :brand

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  enum status: { active: 1, inactive: 0 }
end

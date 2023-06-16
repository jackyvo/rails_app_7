class Brand < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true

  enum status: { active: 1, inactive: 0 }
end

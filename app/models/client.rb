class Client < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  accepts_nested_attributes_for :user
end

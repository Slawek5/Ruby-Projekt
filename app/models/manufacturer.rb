class Manufacturer < ApplicationRecord



  validates :name, presence: true
  validates :description, length: { maximum: 1000 }, allow_nil: true
end

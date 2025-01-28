class Category < ApplicationRecord


  has_many :parts, dependent: :nullify

  validates :name, presence: true
end

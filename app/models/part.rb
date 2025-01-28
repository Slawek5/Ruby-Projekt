class Part < ApplicationRecord
  belongs_to :category, optional: true
  has_and_belongs_to_many :orders
  validates :title, presence: true
  validates :sku, presence: true, uniqueness: true


  def full_name
    "#{title} (#{sku})"
  end
end

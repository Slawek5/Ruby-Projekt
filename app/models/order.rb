class Order < ApplicationRecord

  belongs_to :customer
  has_and_belongs_to_many :parts



  validates :status, presence: true


end

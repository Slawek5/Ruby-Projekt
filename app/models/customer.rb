class Customer < ApplicationRecord

  has_many :orders, dependent: :destroy





  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, length: { in: 6..15 }, allow_blank: true


  def full_info
    "#{name} (#{email})"
  end
end

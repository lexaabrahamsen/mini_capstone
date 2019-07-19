class Product < ApplicationRecord
  has_many :orders
#  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :carted_products
  has_many :users, through: :carted_products


  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def is_discounted?
    if price < 10
    end
  end

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
end

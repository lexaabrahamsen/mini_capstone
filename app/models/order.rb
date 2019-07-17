class Order < ApplicationRecord
  belongs_to :products
  belongs_to :user
  has_many :carted_products


  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0 }

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def is_discounted?
  #   if price < 10
  #   end
  # end

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
end

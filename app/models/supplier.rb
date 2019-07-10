class Supplier < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, presence: true

  def supplier
    Products.where(supplier_id: id)
  end
end
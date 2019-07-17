class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :products
  belongs_to :order, optional: true
end

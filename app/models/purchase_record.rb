class PurchaseRecord < ApplicationRecord
  has_one :street_address
  belongs_to :user
  belongs_to :item
end

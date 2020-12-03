class PurchaseRecord < ApplicationRecord
  has_one :street_address
  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :item_id, presence: true
end

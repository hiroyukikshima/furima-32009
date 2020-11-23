class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_charges_id, presence: true
  validates :shipment_source_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true
end

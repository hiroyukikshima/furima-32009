class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipment_source
  belongs_to :day

  with_options presence: true do
    validates :explanation
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :shipment_source_id
      validates :day_id
    end
    with_options length: { maximum: 40 } do
      validates :title
    end
    with_options numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 } do
      validates :price
    end
  end
end

class StreetAddress < ApplicationRecord
  belongs_to :purchase_record

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
end

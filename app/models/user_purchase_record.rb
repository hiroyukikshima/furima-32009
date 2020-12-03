class UserPurchaseRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :purchase_record, :item_id, :user_id, :token, :price

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    StreetAddress.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end

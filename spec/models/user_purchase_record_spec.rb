require 'rails_helper'

RSpec.describe UserPurchaseRecord, type: :model do
  describe '商品購入者情報の保存' do
    before do
      @user_purchase_record = FactoryBot.build(:user_purchase_record)
    end

    context "商品が購入できる場合" do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user_purchase_record).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user_purchase_record.building_name = nil
        expect(@user_purchase_record).to be_valid
      end
    end
    context "商品が購入できない場合" do
      it 'postal_codeが空だと保存できないこと' do
        @user_purchase_record.postal_code = nil
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_purchase_record.postal_code = '0000000'
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @user_purchase_record.prefecture = 0
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'municipalityが空だと保存できないこと' do
        @user_purchase_record.municipality = nil
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @user_purchase_record.address = nil
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @user_purchase_record.phone_number = nil
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @user_purchase_record.phone_number = '000000000000'
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberにハイフンが入っていると購入できない' do
        @user_purchase_record.phone_number = '000-0000-0000'
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できないこと' do
        @user_purchase_record.token = nil
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが空では購入できないこと' do
        @user_purchase_record.item_id = nil
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では購入できないこと' do
        @user_purchase_record.user_id = nil
        @user_purchase_record.valid?
        expect(@user_purchase_record.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end

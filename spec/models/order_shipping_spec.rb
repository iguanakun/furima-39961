require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空だと購入できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空だと購入できないこと' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと購入できないこと' do
        @order_shipping.municipalities = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空だと購入できないこと' do
        @order_shipping.house_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと購入できないこと' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが半角数字以外だと購入できないこと' do
        @order_shipping.postal_code = 'aaa-aaaa'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが3桁ハイフン4桁でなければ購入できないこと' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'phone_numberが10桁未満だと購入できないこと' do
        @order_shipping.phone_number = '012345678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Enter in 10 to 11 digits')
      end
      it 'phone_numberが11桁より大きいと購入できないこと' do
        @order_shipping.phone_number = '012345678901'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Enter in 10 to 11 digits')
      end
      it 'phone_numberが半角数字以外だと購入できないこと' do
        @order_shipping.phone_number = 'abcdefghij'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberにハイフンが含まれると購入できないこと' do
        @order_shipping.phone_number = '012-345-6789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'userが紐づいていなければ購入できないこと' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

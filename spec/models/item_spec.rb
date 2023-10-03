require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'deliveryCost_idが空だと登録できない' do
        @item.deliveryCost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverycost can't be blank")
      end
      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'deliveryDayが空だと登録できない' do
        @item.deliveryDay_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが9999999より大きいと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceに小数が含まれると登録できない' do
        @item.price = 300.1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが半角数字以外だと登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

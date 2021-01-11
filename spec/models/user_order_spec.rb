require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'tokenが空では登録できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'delivery_area_idが空では登録できないこと' do
        @user_order.delivery_area_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'delivery_area_idが1では登録できないこと' do
        @user_order.delivery_area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it 'municipalityが空だと保存できないこと' do
        @user_order.municipality = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'block_numberが空だと保存できないこと' do
        @user_order.block_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Block number can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @user_order.tel = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが9桁以下だと保存できないこと' do
        @user_order.tel = '123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁以上だと保存できないこと' do
        @user_order.tel = '123456789012'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが英数混合だと保存できないこと' do
        @user_order.tel = '090abcdefgh'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end

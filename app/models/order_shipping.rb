class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :item_id, :user_id



  with_options presence: true do
    validates :user_id, :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities, :house_number
    validates :phone_number, length: { in: 10..11 }, numericality: { only_integer: true, message: 'is invalid. Input only number' }
  end

  def save
    # 購入履歴を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, 
                           house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
class UserOrder
    include ActiveModel::Model
    attr_accessor :postal_code, :delivery_area_id, :municipality, :block_number, :building_name, :tel, :user_id, :item_id, :order_id, :token

    with_options presence: true do
      
      validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
      validates :municipality, :block_number
      validates :tel, format: { with: /\A\d{10,11}\z/ }
      validates :token

      validates :delivery_area_id, numericality: { other_than: 1 }

    end
    
    def save

      order = Order.create(item_id: item_id, user_id: user_id)

      Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipality: municipality, block_number: block_number, 
        building_name: building_name, tel: tel, order_id: order.id)

    end
  end

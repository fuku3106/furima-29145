FactoryBot.define do
  factory :item do
    name                  { 'テスト' }
    description           { 'テスト説明' }
    condition_id          { 2 }
    shipping_id           { 2 }
    category_id           { 2 }
    delivery_area_id      { 2 }
    days_to_ship_id       { 2 }
    price                 { 10_000 }
    user
  end
end

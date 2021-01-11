FactoryBot.define do
  factory :user_order do
    postal_code      { '123-4567' }
    delivery_area_id { 2 }
    municipality     { '東京都' }
    block_number     { '1-1' }
    building_name    { '東京ハイツ' }
    tel              { '09012345678' }
    item_id          { 1 }
    user_id          { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

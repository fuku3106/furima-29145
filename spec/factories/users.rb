FactoryBot.define do
  factory :user do
    nickname              { 'ichiro' }
    email                 { 'test@email.com' }
    password              { 'a12345' }
    password_confirmation { password }
    last_name             { '鈴木' }
    first_name            { '一朗' }
    last_name_kana        { 'スズキ' }
    first_name_kana       { 'イチロウ' }
    birthday              { '1973/10/22' }
  end
end

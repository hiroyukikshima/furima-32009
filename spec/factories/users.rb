FactoryBot.define do
  factory :user do
    nickname              { 'name' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password }
    password_confirmation { password }
    last_name             { '苗字' }
    first_name            { '名前' }
    last_name_kana        { 'ミョウジ' }
    first_name_kana       { 'ナマエ' }
    birthday              { '1995-06-19' }
  end
end

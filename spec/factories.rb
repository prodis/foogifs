FactoryGirl.define do
  factory :user do
    name { generate(:name) }
    email { generate(:email) }
    password 'test123'
    password_confirmation 'test123'
  end

  factory :gif do
    giphy_id { generate(:id) }
    url 'http://media4.giphy.com/media/xTka01AN2j5imVcduo/200.gif'
    user
  end

  sequence(:email) { |n| "email#{n}@example.com" }
  sequence(:name)  { |n| "name#{n}" }
  sequence(:id)    { |n| "xTka0#{n}" }
end

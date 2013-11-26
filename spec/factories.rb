FactoryGirl.define do
  factory :user do
    name "Teemu Testaaja"
    email "teemu.testi@example.com"
    password "salasana"
    password_confirmation "salasana"
  end
end
FactoryGirl.define do
  factory :comment do
    user nil
    product nil
    rating 4
    body "example"
  end
end
FactoryGirl.define do
  sequence(:name) do |n|
    if n % 2 == 1
      "cool#{n}"
    else
      "dooh#{n}"
    end
  end
  factory :product do
    price 100
    color "example"
    name
    image_url "example"
    description "example"
  end
end
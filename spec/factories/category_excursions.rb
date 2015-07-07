FactoryGirl.define do
  factory :category_excursion do
    sequence(:name) { |n| "category#{n}" }
  end
end

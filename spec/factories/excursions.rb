FactoryGirl.define do
  factory :excursion, class: Excursion do
    sequence(:title) { |n| "title#{n}" }
    sequence(:description) { |n| "description#{n}" }
    published true
    city

    factory :excursion_with_categories do
      transient do
        categories_count 3
      end

      after(:create) do |excursion, evaluator|
        excursion.category_excursions << create_list(:category_excursion, evaluator.categories_count)
      end
    end
  end
end

FactoryGirl.define do
  factory :category_excursion do
    sequence(:name) { |n| "category#{n}" }

    factory :category_excursion_with_excursion do
      transient do
        categories_count 3
      end

      after(:create) do |category, evaluator|
        category.excursions << create_list(:excursion, evaluator.categories_count)
      end
    end
  end
end

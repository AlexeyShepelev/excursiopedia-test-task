FactoryGirl.define do
  factory :without_role_user, class: User do
    email 'no.role@mail.com'
    password 'n12345678'
    password_confirmation 'n12345678'
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@mail.com" }
    password 'u12345678'
    password_confirmation 'u12345678'
    role UserRole::USER
  end

  factory :admin, class: User do
    email 'admin@mail.com'
    password 'a12345678'
    password_confirmation 'a12345678'
    role UserRole::ADMIN
  end

  factory :moderator, class: User do
    email 'moderator@mail.com'
    password 'm12345678'
    password_confirmation 'm12345678'
    role UserRole::MODERATOR
  end
end

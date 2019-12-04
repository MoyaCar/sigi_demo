FactoryBot.define do
  factory :user do
    email
    password { '123456' }

    # Los usuarios necesitan estar confirmados para poder loguearse.
    trait :confirmed do
      confirmed_at { Date.yesterday }
    end
  end
end

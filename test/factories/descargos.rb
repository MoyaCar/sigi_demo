FactoryBot.define do
  factory :descargo do
    acta
    user

    trait :completo do
      texto { generate :string_unico }
    end
  end
end

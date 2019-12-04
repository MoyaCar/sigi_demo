FactoryBot.define do
  factory :dictamen do
    expediente
    identificador { generate :string_unico }

    trait :completo do
      texto { generate :string_unico }
    end
  end
end

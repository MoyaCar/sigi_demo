FactoryBot.define do
  factory :expediente do
    identificador { generate :string_unico }

    trait :completo do
      tipo_de_documento { generate :string_unico }
      referencia { generate :string_unico }
    end
  end
end

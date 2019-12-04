FactoryBot.define do
  factory :tipo_de_infraccion do
    identificador { generate :string_unico }

    trait :completo do
      descripcion { generate :string_unico }
    end
  end
end

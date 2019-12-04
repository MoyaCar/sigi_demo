FactoryBot.define do
  factory :resolucion do
    dictamen

    trait :completa do
      observacion { generate :string_unico }
      multa { generate :numero_unico }
    end
  end
end

FactoryBot.define do
  factory :adjunto do
    # Asociamos un adjuntable default porque es requisito.
    para_expediente
    referencia { generate :string_unico }

    trait :para_expediente do
      association :adjuntable, factory: :expediente
    end

    trait :para_acta do
      association :adjuntable, factory: :acta
    end
  end
end

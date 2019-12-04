FactoryBot.define do
  factory :acta do
    numero { generate :string_unico }

    trait :completa do
      expediente
      tipo_de_infraccion
      lugar { generate :string_unico }
      tipo_de_unidad { generate :string_unico }
      tipo_de_servicio { generate :string_unico }
      dominio { generate :string_unico }
      titular { generate :string_unico }
      grupo { generate :string_unico }
      documento { generate :string_unico }
      domicilio { generate :string_unico }
      estado { generate :string_unico }
      unidad_retenida { true }
      lista_de_pasajeros { true }
      fecha_y_hora { Time.zone.now }
    end
  end
end

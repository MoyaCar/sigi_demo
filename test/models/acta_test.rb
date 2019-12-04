require 'test_helper'

describe Acta do
  describe 'validaciones' do
    it 'requiere numero' do
      build(:acta, numero: nil).wont_be :valid?
    end

    it 'el numero es único' do
      existente = create(:acta)
      build(:acta, numero: existente.numero).wont_be :valid?
    end

    it 'requiere estado' do
      build(:acta, estado: nil).wont_be :valid?
    end
  end

  describe '#estado' do
    it 'Acta tiene estado inicial' do
      Acta.new.estado.wont_be :nil?
    end
  end

  describe 'relaciones destroy' do
    it 'destruye descargo al borrar acta' do
      acta = create(:descargo).acta

      -> { acta.destroy }.must_differ 'Descargo.count', -1
    end
  end

  describe '#fecha_de_asociacion' do
    it 'se actualiza cuando se asocia un expediente' do
      acta = create :acta
      acta.fecha_de_asociacion.must_be :nil?

      acta.update expediente: create(:expediente)

      acta.fecha_de_asociacion.wont_be :nil?
    end

    it 'se nulifica cuando se desasocia del expediente' do
      acta = create :acta, :completa
      acta.fecha_de_asociacion.wont_be :nil?

      acta.update expediente: nil

      acta.fecha_de_asociacion.must_be :nil?
    end
  end
end

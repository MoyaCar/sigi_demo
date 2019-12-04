require 'test_helper'

describe Expediente do
  describe 'validaciones' do
    it 'requiere identificador' do
      build(:expediente, identificador: nil).wont_be :valid?
    end

    it 'el identificador es único' do
      existente = create(:expediente)
      build(:expediente, identificador: existente.identificador).wont_be :valid?
    end
  end

  describe 'relaciones destroy' do
    it 'destruye actas al borrar expediente' do
      expediente = create(:acta, :completa).expediente

      -> { expediente.destroy }.must_change 'Acta.count', -1
    end
  end
end

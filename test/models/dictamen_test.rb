require 'test_helper'

describe Dictamen do
  let(:dictamen) { create :dictamen }
  let(:expediente) { dictamen.expediente }

  describe 'validaciones' do
    it 'requiere un expediente' do
      build(:dictamen, expediente_id: nil).wont_be :valid?
    end

    it 'requiere un identificador' do
      build(:dictamen, identificador: nil).wont_be :valid?
    end

    it 'tiene identificador único en el scope de expediente' do
      build(:dictamen, identificador: dictamen.identificador).must_be :valid?
      build(:dictamen, identificador: dictamen.identificador,
        expediente_id: dictamen.expediente).wont_be :valid?
    end
  end

  describe 'relaciones destroy' do
    it 'destruye resolución al borrar dictamen' do
      dictamen = create(:resolucion).dictamen

      -> { dictamen.destroy }.must_differ 'Resolucion.count', -1
    end
  end
end

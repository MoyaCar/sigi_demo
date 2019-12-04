require "test_helper"

describe TipoDeInfraccion do
  describe 'validaciones' do
    it 'requiere identificador' do
      build(:tipo_de_infraccion, identificador: nil).wont_be :valid?
    end

    it 'el identificador es único' do
      existente = create(:tipo_de_infraccion)
      build(:tipo_de_infraccion, identificador: existente.identificador).wont_be :valid?
    end
  end
end

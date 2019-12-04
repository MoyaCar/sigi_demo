require 'test_helper'

describe Resolucion do
  let(:resolucion) { create :resolucion }

  describe 'validaciones' do
    it 'requiere un dictamen' do
      build(:resolucion, dictamen_id: nil).wont_be :valid?
    end
  end
end

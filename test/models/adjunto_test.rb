require 'test_helper'

describe Adjunto do
  describe 'validaciones' do
    it 'requiere referencia' do
      build(:adjunto, referencia: nil).wont_be :valid?
    end

    it 'requiere adjuntable' do
      build(:adjunto, adjuntable: nil).wont_be :valid?
    end
  end
end

require 'test_helper'

describe Descargo do
  describe 'validaciones' do
    it 'requiere un acta' do
      build(:descargo, acta_id: nil).wont_be :valid?
    end

    it 'requiere un usuario' do
      build(:descargo, user_id: nil).wont_be :valid?
    end
  end
end

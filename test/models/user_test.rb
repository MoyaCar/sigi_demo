require 'test_helper'

describe User do
  describe 'relaciones destroy' do
    it 'destruye descargo al borrar usuario' do
      user = create(:descargo).user

      -> { user.destroy }.must_differ 'Descargo.count', -1
    end
  end
end

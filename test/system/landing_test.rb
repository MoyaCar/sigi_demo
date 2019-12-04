require 'application_system_test_case'

class LandingTest < ApplicationSystemTestCase
  describe 'Anónimamente' do
    it 'muestra el landing desde root' do
      visit root_path

      page.must_have_css '.fondo'
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }

    before { login usuario }

    it 'muestra el landing desde root' do
      visit root_path

      page.must_have_css '.fondo'
    end
  end
end

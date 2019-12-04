require 'application_system_test_case'

class ExpedientesTest < ApplicationSystemTestCase
  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }
    let(:expediente) { create :expediente }
    let(:acta) { create :acta, :completa }

    before { login usuario }

    it 'permite ir a expedientes desde la navegación' do
      visit root_path

      click_link 'Expedientes'

      page.must_have_current_path expedientes_path
    end

    it 'permite ir y volver entre index y un expediente' do
      expediente.must_be :persisted?

      visit expedientes_path

      within "#expediente-#{expediente.id}" do
        click_link 'Mostrar'
      end

      page.must_have_current_path expediente_path(expediente)

      click_link 'Volver'

      page.must_have_current_path expedientes_path
    end

    it 'permite ir y volver entre un expediente y sus actas' do
      expediente = acta.expediente

      visit expediente_path(expediente)

      within "#acta-#{acta.id}" do
        click_link 'Mostrar'
      end

      page.must_have_current_path acta_path(acta)

      click_link 'Volver'

      page.must_have_current_path expediente_path(expediente)
    end
  end
end

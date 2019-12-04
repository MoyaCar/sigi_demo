require 'application_system_test_case'

class ActasTest < ApplicationSystemTestCase
  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }
    let(:acta) { create :acta, :completa }
    let(:expediente) { acta.expediente }

    before { login usuario }

    it 'permite ir a actas desde la navegación' do
      visit root_path

      click_link 'Actas'

      page.must_have_current_path actas_path
    end

    it 'permite ir y volver entre index y un acta' do
      acta.must_be :persisted?

      visit actas_path

      within "#acta-#{acta.id}" do
        click_link 'Mostrar'
      end

      page.must_have_current_path acta_path(acta)

      click_link 'Volver'

      page.must_have_current_path actas_path
    end

    it 'permite ir y volver entre un acta y el expediente correspondiente' do
      visit acta_path(acta)

      click_link expediente.identificador

      page.must_have_current_path expediente_path(expediente)

      click_link 'Volver'

      page.must_have_current_path acta_path(acta)
    end
  end
end

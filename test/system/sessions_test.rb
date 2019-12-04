require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase
  let(:usuario) { create :user, :confirmed }

  describe 'Anónimamente' do
    it 'redirige al login desde una ruta no autorizada' do
      visit ruta_no_autorizada

      page.must_have_current_path new_user_session_path
      page.must_have_content I18n.t('devise.failure.unauthenticated')
    end

    it 'permite loguearse persistentemente' do
      visit root_path

      click_link 'Entrar'

      within 'form' do
        fill_in 'Email', with: usuario.email
        fill_in 'Contraseña', with: usuario.password
        check 'Recordarme'
      end

      click_button I18n.t('devise.sessions.new.sign_in')

      page.must_have_current_path root_path
      page.must_have_content I18n.t('devise.sessions.signed_in')
      cookie(:remember_user_token).must_be :present?
    end

    it 'permite loguearse' do
      login usuario

      page.must_have_current_path root_path
      page.must_have_content I18n.t('devise.sessions.signed_in')
      cookie(:remember_user_token).wont_be :present?
    end

    it 'no permite loguearse sin confirmar la cuenta' do
      usuario = create :user

      login usuario

      page.must_have_current_path new_user_session_path
      page.must_have_content I18n.t('devise.failure.unconfirmed')
    end

    describe 'desde el Login' do
      before { visit new_user_session_path }

      it 'permite ir a Registrarse' do
        within 'body .container-fluid' do
          click_link I18n.t('devise.shared.links.sign_up')
        end

        page.must_have_current_path new_user_registration_path
      end

      it 'permite ir a Recuperar contraseña' do
        click_link I18n.t('devise.shared.links.forgot_your_password')

        page.must_have_current_path new_user_password_path
      end

      it 'permite ir a Reenviar confirmación' do
        click_link I18n.t('devise.shared.links.didn_t_receive_confirmation_instructions')

        page.must_have_current_path new_user_confirmation_path
      end
    end
  end

  describe 'Autenticado' do
    before { login usuario }

    it 'permite desloguearse' do
      visit root_path

      click_link 'Salir'

      page.must_have_current_path root_path
      page.must_have_content I18n.t('devise.sessions.signed_out')
    end
  end
end

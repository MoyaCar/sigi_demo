require 'application_system_test_case'

class RegistrationsTest < ApplicationSystemTestCase
  describe 'Anónimamente' do
    it 'permite registrarse' do
      visit root_path
      usuario = build :user

      click_link 'Registrarse'

      within 'form' do
        fill_in 'Email', with: usuario.email
        fill_in 'Contraseña', with: usuario.password
        fill_in 'Confirmación de la contraseña', with: usuario.password
      end

      click_button I18n.t('devise.registrations.new.sign_up')

      page.must_have_current_path root_path
      page.must_have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')

      open_email(usuario.email).must_be :present?
      current_email.subject.must_equal I18n.t('devise.mailer.confirmation_instructions.subject')
    end

    describe 'Desde Registrarse' do
      before { visit new_user_registration_path }

      it 'permite ir a Iniciar sesión' do
        click_link I18n.t('devise.shared.links.sign_in')

        page.must_have_current_path new_user_session_path
      end

      it 'permite ir a Reenviar confirmación' do
        click_link I18n.t('devise.shared.links.didn_t_receive_confirmation_instructions')

        page.must_have_current_path new_user_confirmation_path
      end
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }

    before { login usuario }

    it 'permite actualizar datos de cuenta' do
      visit root_path
      nuevo_password = build(:user).password

      click_link 'Cuenta'

      within 'form#edit_user' do
        fill_in 'Email', with: usuario.email
        fill_in 'Contraseña', with: nuevo_password
        fill_in 'Confirmación de la contraseña', with: nuevo_password
        fill_in 'Contraseña actual', with: usuario.password
      end

      click_button I18n.t('devise.registrations.edit.update')

      usuario.password.must_equal nuevo_password
      page.must_have_current_path root_path
      page.must_have_content I18n.t('devise.registrations.updated')
    end

    it 'permite anular la cuenta' do
      visit root_path

      click_link 'Cuenta'

      page.accept_confirm do
        click_button I18n.t('devise.registrations.edit.cancel_my_account')
      end

      page.must_have_current_path root_path
      page.must_have_content I18n.t('devise.registrations.destroyed')
    end
  end
end

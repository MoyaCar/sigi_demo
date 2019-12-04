require 'application_system_test_case'

class PasswordsTest < ApplicationSystemTestCase
  let(:usuario) { create :user, :confirmed }

  describe 'Anónimamente' do
    describe 'desde Nueva Contraseña' do
      before { visit new_user_password_path }

      it 'envía instrucciones para recuperar la contraseña' do
        within 'form' do
          fill_in 'Email', with: usuario.email
        end

        click_button I18n.t('devise.passwords.new.send_me_reset_password_instructions')
        page.must_have_content I18n.t('devise.passwords.send_instructions')

        open_email(usuario.email).must_be :present?
        current_email.subject.must_equal I18n.t('devise.mailer.reset_password_instructions.subject')
      end

      it 'permite cambiar la contraseña' do
        within 'form' do
          fill_in 'Email', with: usuario.email
        end

        click_button I18n.t('devise.passwords.new.send_me_reset_password_instructions')

        open_email(usuario.email)
        current_email.click_link I18n.t('devise.mailer.reset_password_instructions.action')

        nuevo_password = build(:user).password
        within 'form' do
          fill_in 'Nueva contraseña', with: nuevo_password
          fill_in 'Confirme la nueva contraseña', with: nuevo_password
        end

        click_button I18n.t('devise.passwords.edit.change_my_password')

        page.must_have_current_path root_path
        page.must_have_content I18n.t('devise.passwords.updated')
      end

      it 'permite ir a Iniciar sesión' do
        click_link I18n.t('devise.shared.links.sign_in')

        page.must_have_current_path new_user_session_path
      end

      it 'permite ir a Registrarse' do
        within 'body .container-fluid' do
          click_link I18n.t('devise.shared.links.sign_up')
        end

        page.must_have_current_path new_user_registration_path
      end

      it 'permite ir a Reenviar confirmación' do
        click_link I18n.t('devise.shared.links.didn_t_receive_confirmation_instructions')

        page.must_have_current_path new_user_confirmation_path
      end
    end
  end
end

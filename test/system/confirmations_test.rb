require 'application_system_test_case'

class ConfirmationsTest < ApplicationSystemTestCase
  let(:usuario) { create :user }

  describe 'Anónimamente' do
    describe 'desde Confirmaciones' do
      before { visit new_user_confirmation_path }

      it 'envía instrucciones de confirmación' do
        within 'form' do
          fill_in 'Email', with: usuario.email
        end

        click_button I18n.t('devise.confirmations.new.resend_confirmation_instructions')

        page.must_have_current_path new_user_session_path
        page.must_have_content I18n.t('devise.confirmations.send_instructions')

        open_email(usuario.email).must_be :present?
        current_email.subject.must_equal I18n.t('devise.mailer.confirmation_instructions.subject')
      end

      it 'permite confirmar la cuenta' do
        within 'form' do
          fill_in 'Email', with: usuario.email
        end

        click_button I18n.t('devise.confirmations.new.resend_confirmation_instructions')

        open_email(usuario.email)
        current_email.click_link I18n.t('devise.mailer.confirmation_instructions.action')

        page.must_have_current_path new_user_session_path
        page.must_have_content I18n.t('devise.confirmations.confirmed')
      end

      it 'avisa que el usuario ya está confirmado' do
        usuario = create :user, :confirmed

        within 'form' do
          fill_in 'Email', with: usuario.email
        end

        click_button I18n.t('devise.confirmations.new.resend_confirmation_instructions')

        page.must_have_current_path user_confirmation_path
        page.must_have_content I18n.t('errors.messages.already_confirmed')
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

      it 'permite ir a Recuperar contraseña' do
        click_link I18n.t('devise.shared.links.forgot_your_password')

        page.must_have_current_path new_user_password_path
      end
    end
  end
end

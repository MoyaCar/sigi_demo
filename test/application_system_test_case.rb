# Configuración general de los tests de sistema.

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Helpers para inicializar modelos en los tests.
  include FactoryBot::Syntax::Methods
  # Manejo de emails.
  include Capybara::Email::DSL

  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  # Cosas a configurar antes de cada test.
  def setup
    # Configurar que los emails se envíen desde el server actual que levantó
    # Capybara.
    ActionMailer::Base.default_url_options = {
      host: page.server.host,
      port: page.server.port
    }
  end

  # Ejemplo de ruta que requiere estar logueadx.
  def ruta_no_autorizada
    actas_path
  end

  # Realiza el proceso de login para el usuario indicado.
  def login(usuario)
    visit new_user_session_path

    within 'form#new_user' do
      fill_in User.human_attribute_name(:email), with: usuario.email
      fill_in User.human_attribute_name(:password), with: usuario.password
    end

    click_button I18n.t('devise.sessions.new.sign_in')
  end

  # Devuelve una cookie por nombre, o nil si no existe.
  def cookie(nombre)
    cookie_jar.find { |cookie| cookie[:name] == nombre.to_s }
  end

  # Devuelve todas las cookies seteadas en esta sesión.
  def cookie_jar
    page.driver.browser.manage.all_cookies
  end
end

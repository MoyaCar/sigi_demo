# Configuración general de los tests.

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/pride'
require 'minitest/rails'
require 'capybara/minitest/spec'

class ActiveSupport::TestCase
  # Helpers para inicializar modelos.
  include FactoryBot::Syntax::Methods

  # Correr los tests con workers en paralelo. Definir temporalmente con la
  # variable de entorno PARALLEL_WORKERS.
  parallelize workers: :number_of_processors

  before :each do
    # Iniciar una transacción (el método default para ActiveRecord).
    DatabaseCleaner.start
  end

  after :each do
    # Volver atrás la transacción.
    DatabaseCleaner.clean
  end
end

class ActionDispatch::IntegrationTest
  # Helpers para loguear y desloguear en los test de integración.
  include Devise::Test::IntegrationHelpers
end

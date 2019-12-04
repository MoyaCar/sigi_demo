# Superclase abstracta para todos los controladores.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end

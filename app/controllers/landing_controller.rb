# Controlador de la página de landing.
class LandingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end
end

# Controlador de Descargo, anidado con Acta
class DescargosController < ApplicationController
  before_action :set_acta
  before_action :set_descargo, only: [:show, :edit, :update, :destroy]

  def index
    @descargos = @acta.descargos
  end

  def show
  end

  def new
    @descargo = @acta.descargos.build
  end

  def edit
  end

  def create
    @descargo = @acta.descargos.build descargo_params.merge(user: current_user)

    respond_to do |format|
      if @descargo.save
        format.html do
          redirect_to acta_path(@acta), notice: 'El descargo fue creado con éxito.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @descargo.update(descargo_params)
        format.html do
          redirect_to acta_descargo_path(@acta, @descargo),
            notice: 'El descargo fue actualizado con éxito.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @descargo.destroy

    respond_to do |format|
      format.html do
        redirect_to acta_path(@acta), notice: 'El descargo fue destruido con éxito.'
      end
    end
  end

  private

  def set_descargo
    @descargo = @acta.descargos.find(params[:id])
  end

  def set_acta
    @acta = Acta.find(params[:acta_id])
  end

  def descargo_params
    params.require(:descargo).permit(:texto)
  end
end

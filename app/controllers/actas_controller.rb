# Controlador de Acta
class ActasController < ApplicationController
  before_action :set_acta, only: [:show, :edit, :update, :destroy]

  def index
    @actas = Acta.all
  end

  def show
  end

  def new
    @acta = Acta.new
    # Inicializar un nuevo adjunto para el form builder.
    @acta.adjuntos.build
  end

  def edit
    @acta.adjuntos.build
  end

  def create
    @acta = Acta.new(acta_params)

    respond_to do |format|
      if @acta.save
        format.html do
          redirect_to actas_path, notice: 'El acta fue creada con éxito.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @acta.update(acta_params)
        format.html do
          redirect_to @acta, notice: 'El acta fue actualizada con éxito.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @acta.destroy

    respond_to do |format|
      format.html do
        redirect_to actas_path,
          notice: 'El acta fue destruida con éxito.'
      end
    end
  end

  private

  def set_acta
    @acta = Acta.find(params[:id])
  end

  def acta_params
    params.require(:acta).permit(
      :numero, :tipo_de_infraccion_id, :lugar, :tipo_de_unidad, :tipo_de_servicio,
      :dominio, :titular, :grupo, :documento, :domicilio, :unidad_retenida,
      :lista_de_pasajeros, :fecha_y_hora, :estado, :expediente_id,
      adjuntos_attributes: [
        :archivo, :referencia, :id, :_destroy
      ]
    )
  end
end

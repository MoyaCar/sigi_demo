# Controlador de Expediente
class ExpedientesController < ApplicationController
  before_action :set_expediente, only: [:show, :edit, :update, :destroy]

  def index
    @expedientes = Expediente.all
  end

  def show
  end

  def new
    @expediente = Expediente.new
    # Inicializar un nuevo adjunto para el form builder.
    @expediente.adjuntos.build
  end

  def edit
    @expediente.adjuntos.build
  end

  def create
    @expediente = Expediente.new(expediente_params)

    respond_to do |format|
      if @expediente.save
        format.html do
          redirect_to expedientes_path, notice: 'El expediente fue creado con éxito.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @expediente.update(expediente_params)
        format.html do
          redirect_to @expediente, notice: 'El expediente fue actualizado con éxito.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @expediente.destroy

    respond_to do |format|
      format.html do
        redirect_to expedientes_path,
          notice: 'El expediente fue destruido con éxito.'
      end
    end
  end

  protected

  def set_expediente
    @expediente = Expediente.find(params[:id])
  end

  def expediente_params
    params.require(:expediente).permit(
      :identificador, :tipo_de_documento, :referencia,
      adjuntos_attributes: [
        :archivo, :referencia, :id, :_destroy
      ]
    )
  end
end

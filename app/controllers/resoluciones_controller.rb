# Controlador de Resolucion, anidada con Dictamen.
class ResolucionesController < ApplicationController
  before_action :set_dictamen
  before_action :verificar_resolucion, only: [:new, :create]
  before_action :set_resolucion, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @resolucion = @dictamen.build_resolucion
  end

  def edit
  end

  def create
    @resolucion = @dictamen.build_resolucion(resolucion_params)

    respond_to do |format|
      if @resolucion.save
        format.html do
          redirect_to dictamen_resolucion_path(@dictamen),
            notice: 'La resolución fue creada con éxito.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @resolucion.update(resolucion_params)
        format.html do
          redirect_to dictamen_resolucion_path(@dictamen),
            notice: 'La resolución fue actualizada con éxito.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @resolucion.destroy

    respond_to do |format|
      format.html do
        redirect_to expediente_dictamen_path(@dictamen.expediente, @dictamen),
          notice: 'La resolución fue destruida con éxito.'
      end
    end
  end

  private

  def set_dictamen
    @dictamen = Dictamen.find(params[:dictamen_id])
  end

  def set_resolucion
    @resolucion = @dictamen.resolucion
  end

  def resolucion_params
    params.require(:resolucion).permit(:observacion, :multa, :dictamen_id)
  end

  def verificar_resolucion
    if @dictamen.resolucion.present?
      redirect_to dictamen_resolucion_path(@dictamen),
        notice: 'Ya existe una resolución para este dictamen.'
    end
  end
end

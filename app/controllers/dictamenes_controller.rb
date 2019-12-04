# Controlador de Dictamen, anidado con Expediente
class DictamenesController < ApplicationController
  before_action :set_expediente
  before_action :set_dictamen, only: [:show, :edit, :update, :destroy]

  def index
    @dictamenes = @expediente.dictamenes
  end

  def show
  end

  def new
    @dictamen = @expediente.dictamenes.build
  end

  def edit
  end

  def create
    @dictamen = @expediente.dictamenes.build(dictamen_params)

    respond_to do |format|
      if @dictamen.save
        format.html do
          redirect_to expediente_path(@expediente),
            notice: 'El dictamen fue creado con éxito.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @dictamen.update(dictamen_params)
        format.html do
          redirect_to expediente_dictamen_path(@expediente, @dictamen),
            notice: 'El dictamen fue actualizado con éxito.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dictamen.destroy

    respond_to do |format|
      format.html do
        redirect_to expediente_path(@expediente),
          notice: 'El dictamen fue destruido con éxito.'
      end
    end
  end

  private

  def set_expediente
    @expediente = Expediente.find(params[:expediente_id])
  end

  def set_dictamen
    @dictamen = @expediente.dictamenes.find(params[:id])
  end

  def dictamen_params
    params.require(:dictamen).permit(:identificador, :texto)
  end
end

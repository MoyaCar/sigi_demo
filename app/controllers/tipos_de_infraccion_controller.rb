class TiposDeInfraccionController < ApplicationController
  before_action :set_tipo_de_infraccion, only: [:show, :edit, :update, :destroy]

  def index
    @tipos_de_infraccion = TipoDeInfraccion.all
  end

  def show
  end

  def new
    @tipo_de_infraccion = TipoDeInfraccion.new
  end

  def edit
  end

  def create
    @tipo_de_infraccion = TipoDeInfraccion.new(tipo_de_infraccion_params)

    respond_to do |format|
      if @tipo_de_infraccion.save
        format.html do
          redirect_to tipos_de_infraccion_path, notice: 'Tipo de infracción creado con éxito.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tipo_de_infraccion.update(tipo_de_infraccion_params)
        format.html do
          redirect_to @tipo_de_infraccion, notice: 'Tipo de infracción actualizado con éxito.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @tipo_de_infraccion.destroy
        format.html do
          redirect_to tipos_de_infraccion_url,
            notice: 'Tipo de infracción destruido con éxito.'
        end
      else
        format.html do
          redirect_to tipos_de_infraccion_url,
            alert: 'El tipo de infracción está siendo utilizado por algún acta o actas. No pudo destruirse.'
        end
      end
    end
  end

  private

  def set_tipo_de_infraccion
    @tipo_de_infraccion = TipoDeInfraccion.find(params[:id])
  end

  def tipo_de_infraccion_params
    params.require(:tipo_de_infraccion).permit(:identificador, :descripcion)
  end
end

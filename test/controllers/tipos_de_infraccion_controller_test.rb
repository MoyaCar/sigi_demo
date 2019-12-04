require "test_helper"

describe TiposDeInfraccionController do
  describe 'Anónimamente' do
    it 'es redirigido al login' do
      get tipos_de_infraccion_path

      must_redirect_to new_user_session_path
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }
    let(:tipo_de_infraccion) { create :tipo_de_infraccion }

    before { sign_in usuario }

    it 'accede al index' do
      get tipos_de_infraccion_path

      must_respond_with :success
    end

    it 'accede a new' do
      get new_tipo_de_infraccion_path

      must_respond_with :success
    end

    it 'accede a show' do
      get tipo_de_infraccion_path(tipo_de_infraccion.to_param)

      must_respond_with :success
    end

    it 'accede a edit' do
      get edit_tipo_de_infraccion_path(tipo_de_infraccion.to_param)

      must_respond_with :success
    end

    it 'crea un tipo_de_infracción' do
      lambda do
        post tipos_de_infraccion_path, params: { tipo_de_infraccion: attributes_for(:tipo_de_infraccion) }
      end.must_differ 'TipoDeInfraccion.count'

      must_redirect_to tipos_de_infraccion_path
    end

    it 'actualiza un tipo de infracción' do
      tipo_de_infraccion.must_be :persisted?
      tipo_de_infraccion_params = attributes_for :tipo_de_infraccion, :completo

      put tipo_de_infraccion_path(tipo_de_infraccion.to_param), params: { tipo_de_infraccion: tipo_de_infraccion_params }

      tipo_de_infraccion.reload
      tipo_de_infraccion.identificador.must_equal tipo_de_infraccion_params[:identificador]
      tipo_de_infraccion.descripcion.must_equal tipo_de_infraccion_params[:descripcion]

      must_redirect_to tipo_de_infraccion_path(tipo_de_infraccion)
    end

    it 'destruye un tipo de infracción' do
      tipo_de_infraccion.must_be :persisted?

      lambda do
        delete tipo_de_infraccion_path(tipo_de_infraccion.to_param)
      end.must_differ 'TipoDeInfraccion.count', -1

      must_redirect_to tipos_de_infraccion_path
    end

    it 'no destruye un tipo de infracción, si tiene asociado una acta' do

      tipo_de_infraccion.must_be :persisted?
      acta = create(:acta, tipo_de_infraccion: tipo_de_infraccion)

      lambda do
        delete tipo_de_infraccion_path(tipo_de_infraccion.to_param)
      end.must_differ 'TipoDeInfraccion.count', 0

      must_redirect_to tipos_de_infraccion_path
    end
  end
end

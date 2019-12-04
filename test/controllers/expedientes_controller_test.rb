require 'test_helper'

describe ExpedientesController do
  describe 'Anónimamente' do
    it 'es redirigido al login' do
      get expedientes_path

      must_redirect_to new_user_session_path
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }
    let(:expediente) { create :expediente }

    before { sign_in usuario }

    it 'accede al index' do
      get expedientes_path

      must_respond_with :success
    end

    it 'accede a new' do
      get new_expediente_path

      must_respond_with :success
    end

    it 'accede a show' do
      get expediente_path(expediente.to_param)

      must_respond_with :success
    end

    it 'accede a edit' do
      get edit_expediente_path(expediente.to_param)

      must_respond_with :success
    end

    it 'crea un expediente' do
      lambda do
        post expedientes_path, params: { expediente: { identificador: '123' } }
      end.must_differ 'Expediente.count'

      must_redirect_to expedientes_path
    end

    it 'actualiza un expediente' do
      expediente.must_be :persisted?

      expediente_params = attributes_for :expediente, :completo
      put expediente_path(expediente.to_param), params: { expediente: expediente_params }

      expediente.reload
      expediente.identificador.must_equal expediente_params[:identificador]
      expediente.tipo_de_documento.must_equal expediente_params[:tipo_de_documento]
      expediente.referencia.must_equal expediente_params[:referencia]

      must_redirect_to expediente_path(expediente)
    end

    it 'destruye un expediente' do
      expediente.must_be :persisted?

      lambda do
        delete expediente_path(expediente.to_param)
      end.must_differ 'Expediente.count', -1

      must_redirect_to expedientes_path
    end
  end
end

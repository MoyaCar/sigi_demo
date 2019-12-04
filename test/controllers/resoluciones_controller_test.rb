require 'test_helper'

describe ResolucionesController do
  let(:resolucion) { create :resolucion }
  let(:dictamen) { resolucion.dictamen }

  describe 'Anónimamente' do
    it 'es redirigido al login' do
      get dictamen_resolucion_path(resolucion.dictamen)

      must_redirect_to new_user_session_path
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }

    before { sign_in usuario }

    it 'accede a new' do
      dictamen = create :dictamen

      get new_dictamen_resolucion_path(dictamen.to_param)

      must_respond_with :success
    end

    it 'no accede a new si ya hay una resolución para el dictamen' do
      resolucion.must_be :persisted?

      get new_dictamen_resolucion_path(dictamen.to_param)

      resolucion.reload.must_be :persisted?
      must_redirect_to dictamen_resolucion_path(dictamen.to_param)
    end

    it 'accede a show' do
      get dictamen_resolucion_path(dictamen.to_param)

      must_respond_with :success
    end

    it 'accede a edit' do
      get edit_dictamen_resolucion_path(dictamen.to_param)

      must_respond_with :success
    end

    it 'crea una resolución si no existe ninguna' do
      dictamen = create :dictamen

      lambda do
        post dictamen_resolucion_path(dictamen.to_param),
          params: { resolucion: attributes_for(:resolucion, :completa) }
      end.must_differ 'Resolucion.count'

      must_redirect_to dictamen_resolucion_path(dictamen.to_param)
    end

    it 'no crea una resolución si ya existe una para el dictamen' do
      resolucion.must_be :persisted?

      lambda do
        post dictamen_resolucion_path(dictamen),
          params: { resolucion: attributes_for(:resolucion, :completa) }
      end.wont_differ 'Resolucion.count'

      resolucion.reload.must_be :persisted?
      must_redirect_to dictamen_resolucion_path(dictamen)
    end

    it 'actualiza una resolución' do
      resolucion.must_be :persisted?
      resolucion_params = attributes_for(:resolucion, :completa)

      put dictamen_resolucion_path(dictamen), params: { resolucion: resolucion_params }

      resolucion.reload
      resolucion.observacion.to_plain_text.must_equal resolucion_params[:observacion]
      resolucion.multa.must_equal resolucion_params[:multa]

      must_redirect_to dictamen_resolucion_path(dictamen)
    end

    it 'destruye una resolución' do
      resolucion.must_be :persisted?

      lambda do
        delete dictamen_resolucion_path(dictamen)
      end.must_differ 'Resolucion.count', -1
    end
  end
end

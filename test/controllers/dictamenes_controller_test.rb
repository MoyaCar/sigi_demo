require 'test_helper'

describe DictamenesController do
  let(:dictamen) { create :dictamen }
  let(:expediente) { dictamen.expediente }

  describe 'Anónimamente' do
    it 'es redirigido al login' do
      get expediente_dictamenes_path(expediente.to_param)

      must_redirect_to new_user_session_path
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }

    before { sign_in usuario }

    it 'accede a new' do
      get new_expediente_dictamen_path(expediente.to_param, dictamen.to_param)

      must_respond_with :success
    end

    it 'accede a show' do
      get expediente_dictamenes_path(expediente.to_param, dictamen.to_param)

      must_respond_with :success
    end

    it 'accede a edit' do
      get edit_expediente_dictamen_path(expediente.to_param, dictamen.to_param)

      must_respond_with :success
    end

    it 'crea un dictamen' do
      expediente = create :expediente

      lambda do
        post expediente_dictamenes_path(expediente),
          params: { dictamen: attributes_for(:dictamen, :completo) }
      end.must_differ 'Dictamen.count'

      expediente.dictamenes.count.must_equal 1

      must_redirect_to expediente_path(expediente)
    end

    it 'actualiza un dictamen' do
      dictamen.must_be :persisted?
      dictamen_params = attributes_for :dictamen, :completo

      put expediente_dictamen_path(expediente.to_param, dictamen.to_param),
        params: { dictamen: dictamen_params }

      dictamen.reload
      dictamen.identificador.must_equal dictamen_params[:identificador]
      dictamen.texto.to_plain_text.must_equal dictamen_params[:texto]

      must_redirect_to expediente_dictamen_path(expediente, dictamen)
    end

    it 'destruye un dictamen' do
      dictamen.must_be :persisted?

      lambda do
        delete expediente_dictamen_path(expediente.to_param, dictamen.to_param)
      end.must_differ 'Dictamen.count', -1

      must_redirect_to expediente_path(expediente)
    end
  end
end

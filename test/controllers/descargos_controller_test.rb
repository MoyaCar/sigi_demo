require 'test_helper'

describe DescargosController do
  let(:descargo) { create :descargo }
  let(:acta) { descargo.acta }

  describe 'Anónimamente' do
    it 'es redirigido al login' do
      get acta_descargos_path(acta.to_param)

      must_redirect_to new_user_session_path
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }

    before { sign_in usuario }

    it 'accede a new' do
      get new_acta_descargo_path(acta.to_param, descargo.to_param)

      must_respond_with :success
    end

    it 'accede a show' do
      get acta_descargos_path(acta.to_param, descargo.to_param)

      must_respond_with :success
    end

    it 'accede a edit' do
      get edit_acta_descargo_path(acta.to_param, descargo.to_param)

      must_respond_with :success
    end

    it 'crea un descargo' do
      acta = create :acta

      lambda do
        post acta_descargos_path(acta), params: { descargo: attributes_for(:descargo, :completo) }
      end.must_differ 'Descargo.count'

      acta.descargos.count.must_equal 1

      must_redirect_to acta_path(acta)
    end

    it 'actualiza un descargo' do
      descargo.must_be :persisted?
      descargo_params = attributes_for :descargo, :completo

      put acta_descargo_path(acta.to_param, descargo.to_param),
        params: { descargo: descargo_params }

      descargo.reload
      descargo.texto.to_plain_text.must_equal descargo_params[:texto]

      must_redirect_to acta_descargo_path(acta, descargo)
    end

    it 'destruye un descargo' do
      descargo.must_be :persisted?

      lambda do
        delete acta_descargo_path(acta.to_param, descargo.to_param)
      end.must_differ 'Descargo.count', -1

      must_redirect_to acta_path(acta)
    end
  end
end

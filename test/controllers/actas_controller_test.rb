require 'test_helper'

describe ActasController do
  describe 'Anónimamente' do
    it 'es redirigido al login' do
      get actas_path

      must_redirect_to new_user_session_path
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }
    let(:acta) { create :acta }

    before { sign_in usuario }

    it 'accede al index' do
      get actas_path

      must_respond_with :success
    end

    it 'accede a new' do
      get new_acta_path

      must_respond_with :success
    end

    it 'accede a show' do
      get acta_path(acta.to_param)

      must_respond_with :success
    end

    it 'accede a edit' do
      get edit_acta_path(acta.to_param)

      must_respond_with :success
    end

    it 'crea un acta' do
      lambda do
        post actas_path, params: { acta: attributes_for(:acta) }
      end.must_differ 'Acta.count'

      must_redirect_to actas_path
    end

    it 'actualiza un acta' do
      acta.must_be :persisted?
      infraccion = create :tipo_de_infraccion
      acta_params = attributes_for :acta, :completa,
        tipo_de_infraccion_id: infraccion.to_param

      put acta_path(acta.to_param), params: { acta: acta_params }

      acta.reload
      acta.numero.must_equal acta_params[:numero]
      acta.tipo_de_infraccion.id.must_equal acta_params[:tipo_de_infraccion_id].to_i
      acta.lugar.must_equal acta_params[:lugar]
      acta.tipo_de_unidad.must_equal acta_params[:tipo_de_unidad]
      acta.tipo_de_servicio.must_equal acta_params[:tipo_de_servicio]
      acta.dominio.must_equal acta_params[:dominio]
      acta.titular.must_equal acta_params[:titular]
      acta.grupo.must_equal acta_params[:grupo]
      acta.documento.must_equal acta_params[:documento]
      acta.domicilio.must_equal acta_params[:domicilio]
      acta.unidad_retenida.must_equal acta_params[:unidad_retenida]
      acta.lista_de_pasajeros.must_equal acta_params[:lista_de_pasajeros]
      acta.estado.must_equal acta_params[:estado]
      acta.fecha_y_hora.localtime.must_be_close_to acta_params[:fecha_y_hora], 1

      must_redirect_to acta_path(acta)
    end

    it 'asocia un acta a un expediente' do
      acta.must_be :persisted?
      acta.fecha_de_asociacion.must_be :nil?
      expediente = create :expediente

      put acta_path(acta.to_param), params: {
        acta: { expediente_id: expediente.to_param }
      }

      acta.reload
      acta.expediente.must_equal expediente
      acta.fecha_de_asociacion.wont_be :nil?
    end

    it 'destruye un acta' do
      acta.must_be :persisted?

      lambda do
        delete acta_path(acta.to_param)
      end.must_differ 'Acta.count', -1

      must_redirect_to actas_path
    end
  end
end

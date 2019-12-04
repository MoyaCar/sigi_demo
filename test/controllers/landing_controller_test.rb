require 'test_helper'

describe LandingController do
  describe 'Anónimamente' do
    it 'accede al landing' do
      get root_path

      must_respond_with :success
    end
  end

  describe 'Autenticado' do
    let(:usuario) { create :user, :confirmed }

    before { sign_in usuario }

    it 'accede al Landing' do
      get root_path

      must_respond_with :success
    end
  end
end

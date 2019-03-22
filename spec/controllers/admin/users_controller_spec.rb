require 'rails_helper'
RSpec.describe Admin::UsersController, type: :controller do
  let(:user){ User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }
  let(:admin){ User.create(email: 'test@test.com', password: "password", password_confirmation: "password", admin: true) }
  describe 'GET index' do
    it 'renders the index template' do
      sign_in admin
      get :index
      expect(response).to render_template('index')
    end

    it 'redirect to root template' do
      sign_in user
      get :index
      expect(response).to redirect_to admin_main_path
    end
  end

  describe 'POST create' do
    let(:user_params) { { email: 'test@mest.com', password: "password", password_confirmation: "password", first_name: "Test" } }
    context 'valid attributes' do
      before do
        sign_in admin
        post :create, params: { user: user_params }
      end
      it 'returns http success' do
        expect(response).to have_http_status(302)
      end

      it 'have contract form' do
        expect(response).to redirect_to admin_users_path
      end
    end
  end
end

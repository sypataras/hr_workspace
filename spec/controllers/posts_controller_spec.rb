require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  let(:user){ User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }
  let(:admin){ User.create(email: 'test@test.com', password: "password", password_confirmation: "password", admin: true) }
  let(:post){ Post.create(title: 'dfsdfsd') }
  describe 'GET index' do
    it 'renders the index template' do
      sign_in user
      get :index
      expect(response).to render_template('index')
    end

    it 'redirect to root template' do
      sign_in admin
      get :index
      expect(response).to redirect_to admin_main_path
    end
  end

  describe 'GET show' do
    before{UsersPost.create(user_id: user.id, post_id: post.id)}
    it 'renders the show template' do
      sign_in user
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
      expect(assigns(:post).users_posts.first.readed).to eq(true)
    end

    it 'renders the show template' do
      sign_in user
      get :show, params: { id: post.id }
      expect(response).to render_template('show')
    end
  end
end

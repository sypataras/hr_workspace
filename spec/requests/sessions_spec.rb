require 'rails_helper'
RSpec.describe "Sessions" do
  it "signs user in and out" do
    # user = create(:user)    ## uncomment if using FactoryBot
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
    sign_in user
    get root_path
    expect(response).to redirect_to posts_path

    sign_out user
    get root_path
    expect(response).not_to render_template(:index)
  end
end

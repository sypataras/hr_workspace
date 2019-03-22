require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it 'invalid user' do
    expect(subject).not_to be_valid
  end

  it 'invalid user' do
    subject.email = 'test@test.test'
    subject.password = 'testtest'
    expect(subject).to be_valid
  end

  describe 'admin?' do
    let(:user) { User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password', admin: true) }
    it 'invalid user' do
      expect(user.admin?).to eq(true)
    end
  end
end

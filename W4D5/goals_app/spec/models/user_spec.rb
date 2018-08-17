require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe 'session token' do
    let(:user) { User.create(username: 'asdf', email: 'asdf@example.com', password: 'asdfasdf') }
    it 'is set automatically' do
      expect(user.session_token).to_not eq(nil)
    end
  end

  describe "uniqueness" do
    before :each do
      create(:user)
    end

    it { should validate_uniqueness_of(:email) }
  end

  # Associations
  it { should have_many(:goals) }
  it { should have_many(:comments) }

  # Public Methods
  describe '::find_by_credentials' do
    before :each do
      User.create(username: 'asdf', email: 'asdf@example.com', password: 'asdfasdf')
    end

    context 'given correct credentials' do
      let(:user) { User.find_by_credentials('asdf@example.com', 'asdfasdf') }

      it 'should find the user' do
        expect(user).to be_a(User)
      end
    end

    context 'given incorrect credentials' do
      let(:user) { User.find_by_credentials('qwerty@example.com', 'qwertyuiop') }

      it 'should find the user' do
        expect(user).to_not be_a(User)
      end
    end
  end

  describe '#reset_session_token!' do
    let(:user) { create(:user) }

    it 'should change the user\'s session token' do
      st1 = user.session_token
      user.reset_session_token!
      st2 = user.session_token

      expect(st1).to_not eq(st2)
    end
  end

  describe '#is_password?' do
    let(:user) { create(:user) }

    context 'given valid password' do
      it 'should return true' do
        expect(user.is_password?('password')).to be true
      end
    end

    context 'given invalid password' do
      it 'should return false' do
        expect(user.is_password?('drowssap')).to be false
      end
    end
  end
end

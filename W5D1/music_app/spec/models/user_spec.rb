require 'rails_helper'

RSpec.describe User do
  subject(:user) do
    FactoryBot.build(:user,
        email: "jonathan@fakesite.com"
        password: "good_password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validates (:email) }

  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#{reset_session_token!}" do
    it "sets a new session token on the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
    end
  end
end

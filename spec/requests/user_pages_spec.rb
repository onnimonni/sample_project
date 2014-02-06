require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it {should have_content(user.name)}
    it {should have_title(user.name)}
  end

  describe "signup page" do
    before { visit signup_path}

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up'))}
  end

  describe "signup" do
    before { visit signup_path }

    let(:submit) { "Create my account" }
    let(:user) { FactoryGirl.create(:user)}

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      describe "after submission" do
        before {click_button submit}

        it {should have_title('Sign up')}
        it {should have_error_message}
        it {should have_content('be blank')}
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.build(:user) }
      before do
        valid_signup(user)
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit}
        let(:registered) { User.find_by(email: 'teemu.testi@example.com')}

        it {should have_link('Sign out')}
        it {should have_title(registered.name)}
        it {should have_success_message('Welcome')}
      end
    end
  end
end

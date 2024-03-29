require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    describe "when not signed in" do
      it "returns http success" do
        get 'home'
        response.should be_success
      end

      it "should not have default content" do
        get 'home'
        response.should_not have_selector("h1", :content => "Pages#home")
      end
    end

    describe "when signed in" do
      before :each do
        @user = test_sign_in(FactoryGirl.create(:user))
        other_user = FactoryGirl.create(:user,
          :email => FactoryGirl.generate(:email))
        other_user.follow!(@user)
      end

      it "should have the right follower / following counts" do
        get :home
        response.should have_selector('a', :href => following_user_path(@user),
                                           :content => "0 following")
        response.should have_selector('a', :href => followers_user_path(@user),
                                           :content => "1 follower")
      end
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end

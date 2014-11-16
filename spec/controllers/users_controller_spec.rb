require 'spec_helper'

RSpec.describe UsersController, :type => :controller do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      expect(response).to be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end

  # ====================================================
  # describe "GET new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to be_success
  #   end

    # it "should have the right title" do
    #   get :new
    #   expect(response).to have_title('Sign up')
    # end
  # end

end

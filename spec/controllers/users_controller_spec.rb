require 'spec_helper'

RSpec.describe UsersController, :type => :controller do
  render_views

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = { :name => "", :email => "", :password => "",:password_confirmation => "" }
        end
    it "should not create a user" do
      lambda do
        post :create, :user => @attr
      end.should_not change(User, :count)
    end
    it "should have the right title" do
      post :create, :user => @attr
      response.should have_selector("title", :content => "Sign up")
    end
    it "should render the 'new' page" do
      post :create, :user => @attr
      response.should render_template('new')
    end
  end
end

  # =============================================

  # describe "GET 'show'" do
  #   before(:each) do
  #     @user = FactoryGirl.create(:user)
  #   end

  #   it "should be successful" do
  #     get :show, :id => @user
  #     expect(response).to be_success
  #   end

  #   it "should find the right user" do
  #     get :show, :id => @user
  #     assigns(:user).should == @user
  #   end
  # end

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

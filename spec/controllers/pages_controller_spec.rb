require 'spec_helper'

RSpec.describe PagesController, :type => :controller do
render_views

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET about" do
    it "should be successfull" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  it "Should have the right title" do
    get :home
    #expect(response).to have_selector("title", :content => "Ruby on Rails Sample App | Home")
    expect(response.body).to match("<title>Ruby on Rails")
  end

end

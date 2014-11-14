require 'spec_helper'

RSpec.describe "LayoutLinks", :type => :request do
  describe "GET /layout_links" do

    it "should have a HOME page" do
      get '/'
      expect(response.body).to match("<title>Home")
    end

    it "should have a Contact page at '/contact'" do
      get '/contact'
      expect(response.body).to match("<title>Contact")
    end

    it "should have an About page at '/about'" do
      get '/about'
      expect(response.body).to match("<title>About")
    end

    it "should have a Help page at '/help'" do
      get '/help'
      expect(response.body).to match("<title>Help")
    end
  end

end

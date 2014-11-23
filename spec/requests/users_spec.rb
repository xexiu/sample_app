require 'spec_helper'

RSpec.describe "Users", :type => :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_index_path
      expect(response.status).to be(200)
    end
  end

  # =============================================

  # describe "Users" do
  #   describe "signup" do
  #     describe "failure" do
  #       it "should not make a new user" do
  #         visit signup_path
  #         fill_in "Name",         :with => ""
  #         fill_in "Email",        :with => ""
  #         fill_in "Password",     :with => ""
  #         fill_in "Confirmation", :with => ""
  #         click_button
  #         response.should render_template('users/new')
  #         response.should have_selector("div#error_explanation")
  #       end
  #     end
  #   end
  # end

end

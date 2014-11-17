class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def create
    @user = User.new(params[:user]) # Is the same as:
    # @user = User.new(:name => "Foo Bar", :email => "foo@invalid",:password => "dude", :password_confirmation => "dude")
    if @user.save
    # Handle a successful save.
    else
      @title = "Sign up"
      render 'new'
    end
  end

end

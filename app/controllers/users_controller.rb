class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  before_filter :authenticate, :except => [:show, :new, :create]

  def index
    @title = 'All Users'
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 20)
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def create
    @user = User.new(user_params) # Is the same as:
    # @user = User.new(:name => "Foo Bar", :email => "foo@invalid",:password => "dude", :password_confirmation => "dude")
    if @user.save
    # Handle a successful save.
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user?(@user)
      redirect_to users_path, notice: "You can't destroy yourself."
    else
      @user.destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :salt, :encrypted_password)
  end

end

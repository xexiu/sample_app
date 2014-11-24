class MicropostsController < ApplicationController
before_filter :authenticate
before_filter :authorized_user, :only => :destroy

  def index
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 20)
  end

  def create
    @micropost  = current_user.microposts.build(micropost_params)
    @user = current_user
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
      else
        flash[:error] = "Something went wrong!!"
        @feed_items = []
        render 'pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to request.referer
  end

  private

  def authorized_user
    @micropost = Micropost.find(params[:id])
    flash[:success] = "Micropost successfull deleted!"
  end

  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end
end

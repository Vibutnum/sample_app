# encoding: utf-8
class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index

  end

  def show
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments.paginate(page: params[:page]).per_page(10)
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @micropost }
    end
  end

  def create
  	@micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "微博创建成功！"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  	@micropost.destroy
    redirect_to user_url(current_user)
  end

  private

   def micropost_params
     params.require(:micropost).permit(:content)
   end

   def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
   end
end
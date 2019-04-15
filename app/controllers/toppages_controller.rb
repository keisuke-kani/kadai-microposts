class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = microposts_resources.build
      @microposts = microposts_resources.order('created_at DESC').page(params[:page])
    end
  end
  
  
  private
  
  
  def microposts_resources # 2回目はDBに接続しないから早くなる。
    @microposts_resources ||= current_user.microposts
  end
  
  
end

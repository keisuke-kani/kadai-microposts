class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
    end
  end
  
  
  private
  
  
  def microposts_resources # 2回目はDBに接続しないから早くなる。
    @microposts_resources ||= current_user.microposts
  end
  
  
end

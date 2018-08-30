class LikesController < ApplicationController
  before_action :authenticate_user!
  def like_toggle
    like = Like.find_by(user: current_user, post_id: params[:id])
    if like.nil?
      Like.create(user: current_user, post_id: params[:id])
    else
      like.destroy
    end
    redirect_to "/posts/#{(params[:id])}/info"
  end
end
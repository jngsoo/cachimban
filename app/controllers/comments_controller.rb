class CommentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_comment, only: [:destroy]
  # before_action :check_owner, only: [:destroy]
  
  def create
    @post = Post.find params[:post_id]
    
 
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    @comment.save
    
    #@post = Post.find params[:post_id]
    if params[:score_w] == 'one'
      @post.wifi = (@post.wifi + 1)/(@post.comments.size + 1)
    elsif params[:score_w] == 'two'
      @post.wifi = (@post.wifi + 2)/(@post.comments.size + 1)
    elsif params[:score_w] == 'three'    
      @post.wifi = (@post.wifi + 3)/(@post.comments.size + 1)
    end
    
    if params[:score_t] == 'one'
      @post.table = (@post.table + 1)/(@post.comments.size + 1)
    elsif params[:score_t] == 'two'
      @post.table = (@post.table + 2)/(@post.comments.size + 1)
    elsif params[:score_t] == 'three'    
      @post.table = (@post.table + 3)/(@post.comments.size + 1)
    end
    
    if params[:score_j] == 'one'
      @post.jam = (@post.jam + 1)/(@post.comments.size + 1)
    elsif params[:score_j] == 'two'
      @post.jam = (@post.jam + 2)/(@post.comments.size + 1)
    elsif params[:score_j] == 'three'    
      @post.jam = (@post.jam + 3)/(@post.comments.size + 1)
    end
    
    if params[:score_r] == 'one'
      @post.rest = (@post.rest + 1)/(@post.comments.size + 1)
    elsif params[:score_r] == 'two'
      @post.rest = (@post.rest + 2)/(@post.comments.size + 1)
    elsif params[:score_r] == 'three'    
      @post.rest = (@post.rest + 3)/(@post.comments.size + 1)
    end
      
    unless params[:hash].nil?
      hashs = params[:hash]
      hashs.each do |hash|
        if hash == "teamplay"
          @post.teamplay += 1.0
        elsif hash == "window"
          @post.window += 1.0
        elsif hash == "laptop"
          @post.laptop += 1.0
        elsif hash == "wall"
          @post.wall += 1.0
        elsif hash == "smoke"
          @post.smoke += 1.0
        end
      end
    end
      
    @post.save
    redirect_to "/posts/#{params[:post_id]}/info"
  end  
 


  # def destroy
  #   @comment.destroy
  #   redirect_to @comment.post
  # end
  
# private
  # def set_comment
  #   @comment = Comment.find params[:id]
  # end
  
  # def comment_params
  #   params.require(:comment).permit(:content, :post_id)
  # end
  
  # def check_owner
  #   redirect_back fallback_location: root_url if @comment.user != current_user
  # end
# end

end
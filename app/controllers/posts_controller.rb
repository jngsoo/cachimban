class PostsController < ApplicationController
  # before_action :filterposts, only: [:filter]
  
  def index
    @posts = Post.all
    
    @search_address = params[:search_place]
    @keyword = ""
    unless params[:real_keyword].nil?
      @keyword = params[:real_keyword]
    end
    @searched_place = @posts
    
    if @search_address != "" and !@search_address.nil?
      @searched_place = []
      @posts.each do |post|
        if @search_address.include? post.address
          @searched_place.push(post)
        end
      end
    end
    
    
    
    
  end
    
  def show
    @post = Post.find params[:id]
    @cafe_pictures = []
    @post.pictures.each do |picture|
      @cafe_pictures.push(picture)
    end
  end
  
  
end


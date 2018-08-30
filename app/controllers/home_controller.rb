class HomeController < ApplicationController
  def main
    @posts = Post.all
    @search_address = params[:search_place]
    # @keyword = ""
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
  
  
end

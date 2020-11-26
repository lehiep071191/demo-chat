class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def new
  	@post = Post.new
  end
  def create 
  	@post = current_user.posts.build post_params
  	if @post.save!
      PostEmailJob.set(wait: 1.minutes).perform_later @post
  		redirect_to post_path @post
  	end	
  end	
  def show

    @comment = current_user.comments.build
    @comments = @post.comments
  end
  private
  def post_params
  	params.require(:post).permit(:body, :post_id, :title,:image)
  end	
  def set_post
    @post = Post.find_by id: params[:id] 
    if @post.nil?
      redirect_to root_url
    end
  end  
end

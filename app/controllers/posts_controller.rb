class PostsController < ApplicationController
  
  def new
  	@post = Post.new
  end
  def create 
   byebug
  	@post = current_user.posts.build post_params
  	if @post.save!
  		redirect_to post_path @post
  	end	
  end	
  def show
  	@post = Post.find_by id: params[:id] 
    @comment = current_user.comments.build
    @comments = @post.comments
  end
  private
  def post_params
  	params.require(:post).permit(:body, :post_id, :title,:image)
  end	
end

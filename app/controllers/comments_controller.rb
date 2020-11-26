class CommentsController < ApplicationController
	def create
		@post = Post.find_by id: params[:post_id]
		@comment = @post.comments.build comment_params
		@comment.user = current_user
		if @comment.save!
			ActionCable.server.broadcast 'comment_channel', 
										content: @comment.content,
										username: @comment.user.name
		end	
	end	
	private
	def comment_params
		params.require(:comment).permit(:content)
	end	
end

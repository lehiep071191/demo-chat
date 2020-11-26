class PostMailer < ApplicationMailer
	def post post
		@post = post
		@url = "localhost:3000/posts/#{post.id}" 
		mail to: post.user.email, subject: "xac nhan"
	end		
end

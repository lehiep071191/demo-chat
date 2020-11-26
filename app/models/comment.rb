class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user
	after_create :appen_comment
	def appen_comment
		CommentJob.perform_now(self)
	end	
end

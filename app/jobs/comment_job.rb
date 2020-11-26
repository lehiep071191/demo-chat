class CommentJob < ApplicationJob
  queue_as :default

  def perform comment
    ActionCable.server.broadcast 'comment_channel', 
										content: comment.content,
										username: comment.user.name,
										count: Comment.count
  end
end

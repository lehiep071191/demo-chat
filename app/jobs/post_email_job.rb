class PostEmailJob < ApplicationJob
  queue_as :default

  def perform post
    PostMailer.post(post).deliver_now
  end
end

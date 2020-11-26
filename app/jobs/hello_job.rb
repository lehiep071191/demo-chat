class HelloJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.hello(user).deliver_now
  end
end

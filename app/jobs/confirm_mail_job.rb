class ConfirmMailJob < ApplicationJob
  queue_as :default

  def perform user
    UserMailer.account_activation(user).deliver_now
  end

end

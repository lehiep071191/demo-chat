class MessagesController < ApplicationController
  before_action :logged_in_user
  def create
  	@room = Room.find_by id: params[:room_id]
  	@message = @room.messages.build(message_params)
  	@message.user = current_user
  	if @message.save! 
  		ActionCable.server.broadcast 'message_channel',
                    message:  render_to_string(@message)

  									# name: @message.user.name,
  									# content: @message.content             
  	end	
  end

  def destroy
    @message = Message.find_by id: params[:id]
    @message.destroy
    respond_to do |format|
      format.html{redirect_to @message.room}
      format.json
    end  
  end
  private
  def message_params
  	params.require(:message).permit(:content)
  end	
  def require_admin
    redirect_to root_url unless current_user.admin?
  end  
end

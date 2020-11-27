class RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end
	def new
		@room = Room.new
	end	
	def create
		@room = Room.new room_params
		if @room.save!
			redirect_to rooms_path
		else
			render :new
		end	
	end	
	def show
		@room = Room.find_by id: params[:id]
		@message = current_user.messages.build
		@messages = @room.messages
	end
	private
	def room_params
		params.require(:room).permit(:topic)
	end	

end

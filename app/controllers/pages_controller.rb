class PagesController < ApplicationController
  def index
  	if logged_in?
		@post = current_user.posts.build
		byebug
		@feed_items = current_user.feed.paginate(page: params[:page])
	
	end
  end
end

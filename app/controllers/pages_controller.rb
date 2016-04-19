class PagesController < ApplicationController

	def index
		if current_user
			@pages =  current_user.pages
	  end
		@page = Page.new
		respond_to do |format|
			format.html
		end
	end

	def create
		@page = current_user.pages.build page_params
    if @page.save
      respond_to do |format|
      	format.js
    	end
    else
      render :action => 'new'
    end
	end

	def new
		@page = Page.new
	end
	

private

  def page_params
    params.require(:page).permit(:bg_color, :font)
  end

end
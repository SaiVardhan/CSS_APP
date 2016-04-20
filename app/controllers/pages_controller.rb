class PagesController < ApplicationController

  before_action :authenticate_user!
  
  def index
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
    params.require(:page).permit(:bg_color, :font, :title)
  end
end
class PaintingsController < ApplicationController
  	
	def index
		@paintings = Painting.all
		#@users = User.paginate(:page => params[:page], :per_page => 5)
	end

	def show
		@painting = Painting.find(params[:id])
	end


end  
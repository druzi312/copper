class PaintingsController < ApplicationController
	
	include PaintingsHelper

	def index
		@paintings = Painting.all
		#@users = User.paginate(:page => params[:page], :per_page => 5)
	end

	def show
		@painting = Painting.find(params[:id])
	end

	def new
		@painting = Painting.new
	end

	def create
 	  @painting = Painting.new(painting_params)
	  @painting.save
	  redirect_to painting_path(@painting)

	end

	def destroy
		@painting = Painting.find(params[:id])
	    @painting.destroy
	    redirect_to painting_path(@painting)		
	end	

end  
class PaintingsController < ApplicationController
	
	include PaintingsHelper
	#before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	#before_action :admin_user,     only: :destroy

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
	  flash[:success] = "Painting Added"
	end

	def destroy
		@painting = Painting.find(params[:id])
	    @painting.destroy
	    redirect_to action: "index"		
	end	

	def edit
	  @painting = Painting.find(params[:id])
	end

	def update
	  @painting = Painting.find(params[:id])
	  @painting.update(painting_params)
	  redirect_to painting_path(@painting)
	  flash[:success] = "Painting Updated"
	end


end  
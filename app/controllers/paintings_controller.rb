class PaintingsController < ApplicationController
	
	include PaintingsHelper
	before_action :logged_in_user, only: [ :edit, :update, :destroy, :new ]
	before_action :admin_user,     only: [ :edit, :update, :destroy, :new ]

	def index
    @paintings  = Painting.all.where(painting_type: "Painting").sort_by &:ordering 
    @paintings2 = Painting.all.where(painting_type: "Commissions").sort_by &:ordering 

    @paintingsFull    = Painting.all.where(painting_type: "Painting").sort_by &:ordering 
    @paintingsFullNon = Painting.all.where(painting_type: "Commissions").sort_by &:ordering 
	end
  	
	def show
		@painting = Painting.find(params[:id])
	end

	def new
		@painting = Painting.new
	end

	def create
 	  @painting = Painting.new(painting_params)
	  if @painting.save
	    redirect_to painting_path(@painting)
	    flash[:success] = "Painting Added"
    else
      flash[:danger] = "Cant save the painting"
      render :new
    end
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
	  
	  respond_to do |format|
	  	format.html { redirect_to painting_path(@painting) }
	  	format.js #render paintings/update.js.erb
	  end
	  	
	  #redirect_to painting_path(@painting)

	  flash[:success] = "Painting Updated"
	end

	def order

    	@paintings = Painting.all.where(painting_type: "Painting").sort_by &:ordering 
    	@paintings2 = Painting.all.where(painting_type: "Commissions").sort_by &:ordering 

    	@paintingsFull = Painting.all.where(painting_featured: true).sort_by &:ordering 
    	@paintingsFullNon = Painting.all.where(painting_featured: false).sort_by &:ordering 

	end

  private

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end   




end  
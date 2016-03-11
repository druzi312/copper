class PaintingsController < ApplicationController
	
	include PaintingsHelper
	before_action :logged_in_user, only: [ :edit, :update, :destroy, :new ]
	before_action :admin_user,     only: [ :edit, :update, :destroy, :new ]

	def index
		#@paintings = @paintings.sort_by{|k,ordering| ordering}
		# @projects = Project.all.sort_by &:created_at

		#@users = User.paginate(:page => params[:page], :per_page => 5)

		#@paintings = Painting.where.not("painting_type = ?", [""].to_yaml)

		#if params[:painting_featured] == true
	
    	#params[:painting_featured] == "true"

    	#@paintings_feature = Painting.find(params[:id])
    	#@paintings = @painting.painting_featured

		#scope :painting_featured, where(:painting_featured => true)
		#scope :non_featured, -> { where(painting_featured: false) }
    	
    #@accomplished_goals = painting.painting_featured
    #@unaccomplished_goals = painting.non_painting_featured

    	@paintings = Painting.all.where(painting_featured: false).sort_by &:ordering 


	#scope :non_painting_featured, -> { where(painting_featured: false) }	
	
    #@paintings = painting.painting_featured
    #@unaccomplished_paint = painting.non_painting_featured

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
class PaintingsController < ApplicationController
	
	include PaintingsHelper
	before_action :logged_in_user, only: [ :edit, :update, :destroy, :new ]
	before_action :admin_user,     only: [ :edit, :update, :destroy, :new ]

	def index
		#@paintings = @paintings.sort_by{|k,ordering| ordering}
		# @projects = Project.all.sort_by &:created_at

		#@paintings = Painting.where.not("painting_type = ?", [""].to_yaml)

		@paintings = Painting.where.not("painting_type = ?", ["paintings"].to_yaml).sort_by &:ordering

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

	def ordering_values
		Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end


end  
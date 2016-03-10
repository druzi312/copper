class TagsController < ApplicationController
	
	before_action :logged_in_user, only: [ :destroy]
	before_action :admin_user,     only: [ :destroy]

	def index
	@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to action: "index"
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

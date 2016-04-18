class ContactsController < ApplicationController
  include ContactsHelper

	def index
		@contacts = Contact.all
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		@contact = Contact.new
	end

	def create
    	@contact = Contact.new(contact_params)
    	@contact.save

    	redirect_to action: "new"
    	flash[:success] = "Your contact has been recieved."

	end
end

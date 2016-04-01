module ContactsHelper

	def contact_params
	  params.require(:contact).permit(:name, :email, :message)
	end

end

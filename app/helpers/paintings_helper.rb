module PaintingsHelper

	def painting_params
		    params.require(:painting).permit(
		    	:title, :body, :ordering, :painting_type, :painting_featured, :tag_list, :image
		    	)
	end

end

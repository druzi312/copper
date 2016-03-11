module PaintingsHelper

	def painting_params
		    params.require(:painting).permit(
		    	:title, :body, :ordering, :painting_type, :tag_list, :image
		    	)
	end

end

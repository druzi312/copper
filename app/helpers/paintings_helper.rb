module PaintingsHelper

	def painting_params
		    params.require(:painting).permit(
		    	:title, :body, :ordering, :painting_type, :painting_featured, :painting_path, :tag_list, :image
		    	)
	end

end

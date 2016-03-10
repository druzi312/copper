module PaintingsHelper

	def painting_params
		    params.require(:painting).permit(:title, :body, :tag_list, :image)
	end

end

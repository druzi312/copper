module PaintingsHelper

	def painting_params
		    params.require(:painting).permit(:title, :body, :image)
	end

end

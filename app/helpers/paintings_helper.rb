module PaintingsHelper

	def painting_params
		params.require(:painting).permit(:title, :body)
	end
	
end

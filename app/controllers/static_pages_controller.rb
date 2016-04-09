class StaticPagesController < ApplicationController
  def home

	#@paintings = Painting.all.where(painting_featured: true).order(:ordering).limit(1)
	@paintings = Painting.all.where(painting_type: "Painting").sort_by &:ordering 
    @paintings2 = Painting.all.where(painting_type: "Commissions").sort_by &:ordering 
    
  end

  def help
  end

  def about
  end

  def music
  end

  def video
  end  

end

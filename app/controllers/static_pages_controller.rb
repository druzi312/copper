class StaticPagesController < ApplicationController
  def home

	#@paintings = Painting.all.where(painting_featured: true).order(:ordering).limit(1)
	@paintings = Painting.all.where(painting_featured: true).order(:ordering)
  end

  def help
  end

  def about
  end

  def music
  end

end

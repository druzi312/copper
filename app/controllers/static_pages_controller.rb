class StaticPagesController < ApplicationController
  def home
	@paintings = Painting.all.where(painting_featured: true).sort_by &:ordering 
  end

  def help
  end

  def about
  end

  #def contact
  #end

end

class Tag < ActiveRecord::Base

	has_many :taggings
	has_many :paintings, through: :taggings

end

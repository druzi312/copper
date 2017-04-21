class Painting < ActiveRecord::Base
	# Upload file for cloudinary
	attr_accessor :upload

	has_attached_file :image, styles: { 
		small: "150x150", 
		medium: "300x300>", 
		thumb: "100x100>", 
		large: "600x600>" 
	}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	has_many :taggings
	has_many :tags, through: :taggings

	validates :title,    presence: true
	validates :ordering, presence: true
	validates :upload,   presence: true, if: :new_record?

	before_create do
		begin
			resp = Cloudinary::Uploader.upload(self.upload)
			self.cloudinary_asset_id = resp["public_id"]
		rescue Exception => err
			errors.add(:upload, err.message)
			false
		end
	end

	scope :non_painting_featured, -> { where(painting_featured: false) }

	def tag_list
	  self.tags.collect do |tag|
	    tag.name
	  end.join(", ")
	end

	def tag_list=(tags_string)
	  tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
	  new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
	  self.tags = new_or_found_tags
	end




end

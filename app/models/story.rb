class Story < ActiveRecord::Base
	belongs_to :user
	geocoded_by :story_address
	after_validation :geocode
	# This method associates the attribute ":avatar" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '800x600>'
  },
  :path => ":rails_root/tmp"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

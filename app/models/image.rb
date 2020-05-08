class Image < ApplicationRecord
	has_many :project_images
	has_many :projects, through: :project_images

	has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :file, presence: true
  do_not_validate_attachment_file_type :file
end

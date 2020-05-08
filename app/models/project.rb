class Project < ApplicationRecord
  belongs_to :user
  has_many :project_images
	has_many :images, through: :project_images
end

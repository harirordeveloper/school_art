class ProjectImage < ApplicationRecord
	belongs_to :project
  belongs_to :image
end
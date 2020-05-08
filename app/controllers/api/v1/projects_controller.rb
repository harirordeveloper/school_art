class Api::V1::ProjectsController < ApplicationController
  def index
  	render json: { projects: current_api_user.projects }
  end
end

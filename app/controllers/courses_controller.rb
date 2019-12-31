class CoursesController < ApplicationController
  # before_action :require_movie, only: [:show]
  
  def index
    data = Course.all
    render status: :ok, json: data
  end
  
  def show
    render(
      status: :ok,
      json: @course.as_json(
        only: [:title, :section, :code, :user_id],
      )
    )
  end
  
  def create
    course = Course.new(title: params[:title], section: params[:section], code: params[:code], user_id: params[:user_id])
    
    if course.save
      render status: :ok, json: { success: "success" }
    else
      render status: :bad_request, json: { errors: rental.errors.messages }
    end
    
  end
  
  private
  
  def course_params
    params.require(:course).permit(:title, :section, :code, :user_id)
  end
  
  def require_movie
    @course = Course.find_by(title: params[:title])
    unless @movie
      render status: :not_found, json: { errors: { title: ["No course with title #{params["title"]}"] } }
    end
  end
end
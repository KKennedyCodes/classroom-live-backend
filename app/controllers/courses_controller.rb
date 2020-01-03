class CoursesController < ApplicationController
  before_action :require_course, only: [:show]
  
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
  
  def require_course
    @course = Course.find_by(id: params[:id])
    unless @course
      render status: :not_found, json: { errors: { id: ["No course with title #{params["id"]}"] } }
    end
  end
end
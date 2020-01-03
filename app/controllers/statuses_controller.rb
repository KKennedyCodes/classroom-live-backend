class StatusesController < ApplicationController
  before_action :require_status, only: [:show]
  
  def index
    data = Status.all
    render status: :ok, json: data
  end
  
  def show
    render(
      status: :ok,
      json: @status.as_json(
        only: [:status_start, :status_end, :student_comment, :teacher_comment, :user_id, :session_id, :code_id],
      )
    )
  end
  
  def create
    course = Status.new(status_start: params[:status_start], status_end: params[:status_end], student_comment: params[:student_comment], teacher_comment: params[:teacher_comment], user_id: params[:user_id], session_id: params[:session_id], code_id: params[:code_id])
    
    if status.save
      render status: :ok, json: { success: "success" }
    else
      render status: :bad_request, json: { errors: status.errors.messages }
    end
    
  end
  
  private
  
  def status_params
    params.require(:status).permit(:status_start, :status_end, :student_comment, :teacher_comment, :user_id, :session_id, :code_id)
  end
  
  def require_status
    @status = Status.find_by(id: params[:id])
    unless @status
      render status: :not_found, json: { errors: { id: ["No status with id #{params["id"]}"] } }
    end
  end
end
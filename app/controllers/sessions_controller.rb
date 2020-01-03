class SessionsController < ApplicationController
  before_action :require_session, only: [:show]
  
  def index
    data = Session.all
    render session: :ok, json: data
  end
  
  def show
    render(
      session: :ok,
      json: @session.as_json(
        only: [:task, :task_objective, :session_start, :session_end, :status, :course_id],
      )
    )
  end
  
  def create
    course = Session.new(task: params[:task], task_objective: params[:task_objective], session_start: params[:session_start], session_end: params[:session_end], status: params[:status], course_id: params[:course_id])
    
    if session.save
      render session: :ok, json: { success: "success" }
    else
      render session: :bad_request, json: { errors: session.errors.messages }
    end
    
  end
  
  private
  
  def session_params
    params.require(:session).permit(:task, :task_objective, :session_start, :session_end, :status, :course_id)
  end
  
  def require_session
    @session = Session.find_by(id: params[:id])
    unless @session
      render session: :not_found, json: { errors: { id: ["No session with id #{params["id"]}"] } }
    end
  end
end
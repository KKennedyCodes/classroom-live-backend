class SessionsController < ApplicationController
  # before_action :require_session, only: [:show, :edit, :update]
  # before_action :find_user_session
  # before_action :session_not_found, only: [:show, :edit, :destroy]
  
  def index
    data = Session.all
    
    
    render json: data.as_json(
      only: [:id, :task, :objective, :date]
    )
  end
  
  # def show
  #   render(
  #     session: :ok,
  #     json: @session.as_json(
  #       only: [:task, :task_objective, :session_start, :session_end, :live, :course_id],
  #     )
  #   )
  # end
  
  # def new
  #   @session = Session.new
  # end
  
  # def create
  #   session = Session.new(task: params[:task], task_objective: params[:task_objective], live: params[:live], course_id: params[:course_id])
  
  #   if session.save
  #     render session: :ok, json: { success: "success" }
  #   else
  #     render session: :bad_request, json: { errors: session.errors.messages }
  #   end
  
  # end
  
  # def edit; end
  
  # def update
  #   if @session.update(session_params)
  #     redirect_to session_path(@session.id)
  #     return
  #   else
  #     render session_path
  #   end
  # end
  
  # def destroy    
  #   @session.destroy
  #   redirect_to root_path
  #   return
  # end
  
  # private
  
  # def session_params
  #   params.require(:session).permit(:task, :task_objective, :session_start, :session_end, :live, :course_id)
  # end
  
  # def require_session
  #   @session = Session.find_by(id: params[:id])
  #   unless @session
  #     render session: :not_found, json: { errors: { id: ["No session with id #{params["id"]}"] } }
  #   end
  # end
  
  # # def find_user_session
  # #   if session[:user_id] == nil
  # #     flash[:error] = "You must be logged in to see this page."
  # #     redirect_to root_path
  # #   end
  # # end
  
  # def session_not_found
  #   if @session.nil?
  #     flash[:error] = "Session with ID: #{params[:id]} was not found."
  #     redirect_to root_path
  #     return
  #   end
  # end
end
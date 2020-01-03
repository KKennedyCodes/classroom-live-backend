class AnswersController < ApplicationController
  before_action :require_answer, only: [:show]
  
  def index
    data = Answer.all
    render status: :ok, json: data
  end
  
  def show
    render(
      status: :ok,
      json: @answer.as_json(
        only: [:answer_text, :user_id, :question_id],
      )
    )
  end
  
  def create
    course = Answer.new(answer_text: params[:answer_text], user_id: params[:user_id], question_id: params[:question_id])
    
    if answer.save
      render status: :ok, json: { success: "success" }
    else
      render status: :bad_request, json: { errors: answer.errors.messages }
    end
    
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:answer_text, :user_id, :question_id)
  end
  
  def require_answer
    @answer = Answer.find_by(id: params[:id])
    unless @answer
      render status: :not_found, json: { errors: { id: ["No answer with id #{params["id"]}"] } }
    end
  end
end
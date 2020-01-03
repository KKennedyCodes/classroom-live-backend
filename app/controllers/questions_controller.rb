class QuestionsController < ApplicationController
  before_action :require_question, only: [:show]
  
  def index
    data = Question.all
    render status: :ok, json: data
  end
  
  def show
    render(
      status: :ok,
      json: @question.as_json(
        only: [:question_text, :visible, :answered, :user_id, :session_id],
      )
    )
  end
  
  def create
    course = Question.new(question_text: params[:question_text], visible: params[:visible], answered: params[:answered], user_id: params[:user_id], session_id: params[:session_id])
    
    if question.save
      render status: :ok, json: { success: "success" }
    else
      render status: :bad_request, json: { errors: question.errors.messages }
    end
    
  end
  
  private
  
  def question_params
    params.require(:question).permit(:question_text, :visible, :answered, :user_id, :session_id)
  end
  
  def require_question
    @question = Question.find_by(id: params[:id])
    unless @question
      render status: :not_found, json: { errors: { id: ["No question with id #{params["id"]}"] } }
    end
  end
end
class CodesController < ApplicationController
  before_action :require_code, only: [:show]
  
  def index
    data = Code.all
    render status: :ok, json: data
  end
  
  def show
    render(
      status: :ok,
      json: @code.as_json(
        only: [:color, :description],
      )
    )
  end
  
  def create
    code = Code.new(color: params[:color], description: params[:description])
    
    if code.save
      render status: :ok, json: { success: "success" }
    else
      render status: :bad_request, json: { errors: code.errors.messages }
    end
    
  end
  
  private
  
  def code_params
    params.require(:code).permit(:color, :description)
  end
  
  def require_code
    @code = Code.find_by(id: params[:id])
    unless @code
      render status: :not_found, json: { errors: { id: ["No code with id #{params["id"]}"] } }
    end
  end
end
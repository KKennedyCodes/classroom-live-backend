class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  
  def index
    data = User.all
    render status: :ok, json: data
  end
  
  def show
    render(
      status: :ok,
      json: @user.as_json(
        only: [:first_name, :last_name, :pronouns, :email],
      )
    )
  end
  
  def create
    course = User.new(first_name: params[:first_name], last_name: params[:last_name], pronouns: params[:pronouns], email: params[:email])
    
    if user.save
      render status: :ok, json: { success: "success" }
    else
      render status: :bad_request, json: { errors: user.errors.messages }
    end
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :pronouns, :email)
  end
  
  def require_user
    @user = User.find_by(id: params[:id])
    unless @user
      render status: :not_found, json: { errors: { id: ["No user with id #{params["id"]}"] } }
    end
  end
end
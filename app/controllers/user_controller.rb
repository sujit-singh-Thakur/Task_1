class UserController < ApplicationController
  def index
    @users = User.all
   
  end
  def show
    id = params.expect(:id)
  @user = User.find(id)
    # @user = @users 
    @enrollments = @user.enrollments.includes(:course)
  end

  def new
    @user = User.all
  end

  def create
    #  @user = User.new(param_user)
   @user= User.new(  param_user = {
    user_name: params[:user_name],
    email: params[:email],
    status: params[:status]
} )
   if @user.save
   redirect_to user_index_url
   else 
    puts @user.errors.full_messages
    render :new
   end
    
  end

  private
  def param_user
    params.expect(User: [:user_name,:status,:email])

  end

end

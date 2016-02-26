class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def new
    @user = User.find(session[:user_id])
    @workouts = Workout.order(id: :desc)

  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.username
      flash[:answer] = "Please Log In"
    else
      flash[:answer] = @user.errors.full_messages
    end
    json_message = {:status => 'success', :message => 'Thank you! We have created a new user!'}
    render json: json_message
    redirect_to "/"
  end

  def login
    @user = User.find_by_email(params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        session[:user_name] = @user.username
        redirect_to '/users/new'
      else
        flash[:error] = "Invalid email or password"
        redirect_to '/'
      end
  end

  def logout
    session.clear
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :dob)
  end
end

class SessionsController < ApplicationController
  def create
    puts 'CODE BELOW HERE'
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.username
      flash[:answer] = "Please Log In"
    else
      flash[:answer] = @user.errors.full_messages
    end
    # json_message = {:status => 'success', :message => 'Thank you! We have created a new user!'}
    # render json: json_message
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :dob)
  end
end

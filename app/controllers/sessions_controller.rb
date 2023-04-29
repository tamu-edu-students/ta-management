class SessionsController < ApplicationController
  def new
  
  end
  
  def create
    @user = User.find_by(email_id: params[:session][:email_id].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      case @user.access_level
      when 'Professor'
        @user1 = Professor.find_by(email_id: params[:email_id])
        redirect_to professor_url(@user)
        # if @user1.nil?
        #   flash[:alert] = 'No Student assigned yet. Please Visit later'
        #   redirect_to '/users/user/login'
        # else
        #   redirect_to "/professors/#{@user1.id}"
        # end
      when 'TA'
        redirect_to user_url(@user)
      when 'Hiring Manager'
        redirect_to '/students'
      when 'Coordinator'
        redirect_to '/subjects'
      when 'admin'
        redirect_to '/admin'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    user = User.find(session[:user_id])
    log_out user
    redirect_to "/"
  end


  private
  # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email_id, :password, :password_confirmation, :access_level)
    end
end

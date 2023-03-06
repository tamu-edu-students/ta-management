class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_id: params[:session][:email_id].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.access_level == "admin"
        log_in user
        redirect_to admin_path
      elsif user.access_level == "Professor"
        log_in user
        redirect_to professor_url(user)
      else
        redirect_to user
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out user
  end
end

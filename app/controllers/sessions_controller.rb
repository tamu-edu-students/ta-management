class SessionsController < ApplicationController
  def new
  
  end
  
  def create
    # user = User.find_by(email_id: params[:session][:email_id].downcase)
    # if user && user.authenticate(params[:session][:password])
    #   if user.access_level == "admin"
    #     log_in user
    #     redirect_to admin_path
    #   elsif user.access_level == "Professor"
    #     log_in user
    #     redirect_to professor_url(user)
    #   else
    #     log_in user
    #     redirect_to user
    #   end
    # else
    #   flash.now[:danger] = 'Invalid email/password combination'
    #   render 'new', status: :unprocessable_entity
    # end

    @user = User.find_by(email_id: params[:session][:email_id].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # session[:id] = @user.id
      log_in @user
      case @user.access_level
      when 'Professor'
        @user1 = Professor.find_by(email_id: params[:email_id])
        if @user1.nil?
          flash[:alert] = 'No Student assigned yet. Please Visit later'
          redirect_to '/users/user/login'
        else
          redirect_to "/professors/#{@user1.id}"
        end
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

  # def create
  #   user = User.new(user_params)
  #   if user && user.authenticate(params[:session][:password])
  #     if user.access_level == "admin"
  #       log_in user
  #       redirect_to admin_path
  #     elsif user.access_level == "Professor"
  #       log_in user
  #       redirect_to professor_url(user)
  #     else
  #       log_in user
  #       redirect_to user
  #     end
  #   else
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new', status: :unprocessable_entity
  #   end
  # end
  
  # def create
  #   # @user = User.new(user_params)
  #   # respond_to do |format|
  #   #   if @user.save
  #   #     log_in @user
  #   #     if params[:access_level] == 'admin'
  #   #       format.html { redirect_to admin_path, notice: "User was successfully created." }
  #   #     else
  #   #       session[:id] = @user.id
  #   #       format.html { redirect_to user_url(@user), notice: "User was successfully created." }
  #   #       format.json { render :show, status: :created, location: @user }
  #   #     end
  #   #   else
  #   #     flash[:alert] = @user.errors.full_messages
  #   #     format.html { render :new, status: :unprocessable_entity }
  #   #     format.json { render json: @user.errors, status: :unprocessable_entity }
  #   #   end
  #   # end
  # end

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

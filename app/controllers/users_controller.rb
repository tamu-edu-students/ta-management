class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all

  end

  def home
    if logged_in?
      user = User.find(session[:user_id])
      redirect_to user_url(user)
    else
      render :home
    end
  end

  def admin
      @hiringManager = User.where(access_level: "Hiring Manager")
      @coordinator = User.where(access_level: "Coordinator")
  end

  # GET /users/1 or /users/1.json
  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_url, notice: "You are not logged in" 
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if(params[:name] || params[:email_id]  || params[:password]  || params[:confirm_password])
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        if params[:access_level] == 'admin'
          format.html { redirect_to admin_path, notice: "User was successfully created." }
        else
          session[:id] = @user.id
          format.html { redirect_to user_url(@user), notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        end
      else
        flash[:alert] = @user.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to admin_url, notice: "User was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end
    # def destroy 
    #   session[:id] = nil
    #   redirect_to root_path, notice: "Logged Out"
    # end

  def login
    @user = User.find_by(email_id: params[:email_id])
    if (User.exists?(email_id: params[:email_id], password: params[:password]))
      session[:id] = @user.id
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
      render :login, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  private 

    def user_params
      params.require(:user).permit(:name, :email_id, :password, :password_confirmation, :access_level)
    end
end

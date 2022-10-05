class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  #Internal API for soft delete
  def delete
    @student = Student.find(params[:id])
    @student.is_active = false
    @student.save!
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy!
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      format.html { redirect_to student_url(@student), notice: "Student application was successful." }
      format.json { render :show, status: :created, location: @student }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @student.errors, status: :unprocessable_entity }
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :email_id, :contact, :employment_status, :is_undergrad, :courses_completed, 
                                    :resume, :transcript)
  end
end

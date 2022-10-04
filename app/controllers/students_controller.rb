class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def delete
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    render 'new' if @student.save
  end

  private
  def student_params
    params.require(:student).permit(:name, :email_id, :contact, :employment_status, :is_undergrad, :courses_completed, 
                                    :resume, :transcript)
  end
end
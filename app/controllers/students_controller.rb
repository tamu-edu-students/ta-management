class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  # GET /students or /students.json
  def index
    @students = Student.all
    search_students if params[:search]
    if params[:sort] == 'application_status'
      @students = Student.all.sort_by(&:application_status)
    elsif params[:sort] != 'application_status'
      @students = Student.order(params[:sort])
    else
      @student = Student.all
    end
  end

  def search_students
    if @student = Student.all.find { |student| student.name.downcase.include?(params[:search].downcase) }
      redirect_to student_url(@student)
    end
  end

  # GET /students/1 or /students/1.json
  def show
    @student = Student.find(params[:id])
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit; end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)
    process_params
    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(update_params)
        format.html { redirect_to student_url(@student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Internal API for soft delete
  def delete
    @student.is_active = false
    @student.save!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:name, :email_id, :uin, :employment_status, :is_undergrad, :courses_completed, :resume, :transcript, :access_level, :application_status, :comments, :assigned_courses, :assigned_sections, :rating, :feedback, :sections)
  end

  def process_params
    @student.employment_status = params[:student][:employment_status] == 'Yes'
    @student.is_undergrad = params[:student][:is_undergrad] == 'Yes'
    @student.courses_completed = params[:student][:courses_completed] == 'Both' ? %w[102 216] : [params[:student][:courses_completed]]
  end

  def update_params
    map = params.require(:student).permit(:name, :email_id, :uin, :employment_status, :is_undergrad, :courses_completed, :resume, :transcript, :access_level, :application_status, :comments, :assigned_courses, :assigned_sections, :rating, :feedback, :subjects)
    if params[:student].has_key?(:employment_status)
      map['employment_status'] = params[:student][:employment_status] == 'Yes'
    end
    if params[:student].has_key?(:is_undergrad)
      map['is_undergrad'] = params[:student][:is_undergrad] == 'Yes'
    end
    if params[:student].has_key?(:courses_completed)
      map['courses_completed'] = params[:student][:courses_completed] == 'Both' ? %w[102 216] : [params[:student][:courses_completed]]
    end

    if params[:student].has_key?(:assigned_courses) && params[:student].has_key?(:subjects)
      course = params[:student][:assigned_courses]
      subjects = params[:student][:subjects]
      sections = []
      subjects.each do |id|
        Subject.find(id)
        sections << Subject.find(id).course_section
      end
      map['assigned_courses'] = [course]
      map['assigned_sections'] = sections
      assign(course, sections)
    end
    # if(params[:student].has_key?(:assigned_sections))
    #   map["assigned_sections"] = [params[:student][:assigned_sections]]
    # end
    map
  end

  def assign(course, sections)
    professor = Professor.find_by(course_list: course)
    subject = Subject.find_by(course_name: course, course_section: sections)
    assignment = Assignment.new
    assignment.subject = subject
    assignment.student = @student
    assignment.professor = professor
    assignment.save!
  end
end

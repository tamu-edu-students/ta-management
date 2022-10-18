require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url, params: { student: { access_level: @student.access_level, application_status: @student.application_status, assigned_courses: @student.assigned_courses, assigned_sections: @student.assigned_sections, comments: @student.comments, uin: @student.uin, courses_completed: @student.courses_completed, email_id: @student.email_id, employment_status: @student.employment_status, feedback: @student.feedback, is_undergrad: @student.is_undergrad, name: @student.name, rating: @student.rating, resume: @student.resume, transcript: @student.transcript } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { access_level: @student.access_level, application_status: @student.application_status, assigned_courses: @student.assigned_courses, assigned_sections: @student.assigned_sections, comments: @student.comments, uin: @student.uin, courses_completed: @student.courses_completed, email_id: @student.email_id, employment_status: @student.employment_status, feedback: @student.feedback, is_undergrad: @student.is_undergrad, name: @student.name, rating: @student.rating, resume: @student.resume, transcript: @student.transcript } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end

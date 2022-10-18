require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Access level", with: @student.access_level
    fill_in "Application status", with: @student.application_status
    fill_in "Assigned courses", with: @student.assigned_courses
    fill_in "Assigned sections", with: @student.assigned_sections
    fill_in "Comments", with: @student.comments
    fill_in "Courses completed", with: @student.courses_completed
    fill_in "Email", with: @student.email_id
    check "Employment status" if @student.employment_status
    fill_in "Feedback", with: @student.feedback
    check "Is undergrad" if @student.is_undergrad
    fill_in "Name", with: @student.name
    fill_in "uin", with: @student.uin
    fill_in "Rating", with: @student.rating
    fill_in "Resume", with: @student.resume
    fill_in "Transcript", with: @student.transcript
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Access level", with: @student.access_level
    fill_in "Application status", with: @student.application_status
    fill_in "Assigned courses", with: @student.assigned_courses
    fill_in "Assigned sections", with: @student.assigned_sections
    fill_in "Comments", with: @student.comments
    fill_in "Courses completed", with: @student.courses_completed
    fill_in "Email", with: @student.email_id
    check "Employment status" if @student.employment_status
    fill_in "Feedback", with: @student.feedback
    check "Is undergrad" if @student.is_undergrad
    fill_in "Name", with: @student.name
    fill_in "uin", with: @student.uin
    fill_in "Rating", with: @student.rating
    fill_in "Resume", with: @student.resume
    fill_in "Transcript", with: @student.transcript
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end

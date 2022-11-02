require 'rails_helper'

RSpec.describe "subjects/new", type: :view do
  before(:each) do
    assign(:subject, Subject.new(
      course_name: "MyString",
      course_section: "MyString"
    ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", subjects_path, "post" do

      assert_select "input[name=?]", "subject[course_name]"

      assert_select "input[name=?]", "subject[course_section]"
    end
  end
end

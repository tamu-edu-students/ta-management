require 'rails_helper'

RSpec.describe "subjects/index", type: :view do
  before(:each) do
    assign(:subjects, [
      Subject.create!(
        course_name: "Course Name",
        course_section: "Course Section"
      ),
      Subject.create!(
        course_name: "Course Name",
        course_section: "Course Section"
      )
    ])
  end

  it "renders a list of subjects" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Course Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Course Section".to_s), count: 2
  end
end

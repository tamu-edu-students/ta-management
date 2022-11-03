require 'rails_helper'

RSpec.describe "subjects/show", type: :view do
  before(:each) do
    assign(:subject, Subject.create!(
      course_name: "Course Name",
      course_section: "Course Section"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Course Name/)
    expect(rendered).to match(/Course Section/)
  end
end

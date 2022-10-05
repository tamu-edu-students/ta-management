require "application_system_test_case"

class ManagementsTest < ApplicationSystemTestCase
  setup do
    @management = managements(:one)
  end

  test "visiting the index" do
    visit managements_url
    assert_selector "h1", text: "Managements"
  end

  test "should create management" do
    visit managements_url
    click_on "New management"

    click_on "Create Management"

    assert_text "Management was successfully created"
    click_on "Back"
  end

  test "should update Management" do
    visit management_url(@management)
    click_on "Edit this management", match: :first

    click_on "Update Management"

    assert_text "Management was successfully updated"
    click_on "Back"
  end

  test "should destroy Management" do
    visit management_url(@management)
    click_on "Destroy this management", match: :first

    assert_text "Management was successfully destroyed"
  end
end

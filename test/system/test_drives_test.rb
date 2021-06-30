require "application_system_test_case"

class TestDrivesTest < ApplicationSystemTestCase
  setup do
    @test_drife = test_drives(:one)
  end

  test "visiting the index" do
    visit test_drives_url
    assert_selector "h1", text: "Test Drives"
  end

  test "creating a Test drive" do
    visit test_drives_url
    click_on "New Test Drive"

    click_on "Create Test drive"

    assert_text "Test drive was successfully created"
    click_on "Back"
  end

  test "updating a Test drive" do
    visit test_drives_url
    click_on "Edit", match: :first

    click_on "Update Test drive"

    assert_text "Test drive was successfully updated"
    click_on "Back"
  end

  test "destroying a Test drive" do
    visit test_drives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test drive was successfully destroyed"
  end
end

require "application_system_test_case"

class MosquesTest < ApplicationSystemTestCase
  setup do
    @mosque = mosques(:one)
  end

  test "visiting the index" do
    visit mosques_url
    assert_selector "h1", text: "Mosques"
  end

  test "should create mosque" do
    visit mosques_url
    click_on "New mosque"

    fill_in "Capacity", with: @mosque.capacity
    fill_in "Description", with: @mosque.description
    fill_in "Establish year", with: @mosque.establish_year
    fill_in "Latitude", with: @mosque.latitude
    fill_in "Location", with: @mosque.location
    fill_in "Longitude", with: @mosque.longitude
    fill_in "Name", with: @mosque.name
    fill_in "Size", with: @mosque.size
    fill_in "Status", with: @mosque.status
    click_on "Create Mosque"

    assert_text "Mosque was successfully created"
    click_on "Back"
  end

  test "should update Mosque" do
    visit mosque_url(@mosque)
    click_on "Edit this mosque", match: :first

    fill_in "Capacity", with: @mosque.capacity
    fill_in "Description", with: @mosque.description
    fill_in "Establish year", with: @mosque.establish_year
    fill_in "Latitude", with: @mosque.latitude
    fill_in "Location", with: @mosque.location
    fill_in "Longitude", with: @mosque.longitude
    fill_in "Name", with: @mosque.name
    fill_in "Size", with: @mosque.size
    fill_in "Status", with: @mosque.status
    click_on "Update Mosque"

    assert_text "Mosque was successfully updated"
    click_on "Back"
  end

  test "should destroy Mosque" do
    visit mosque_url(@mosque)
    accept_confirm { click_on "Destroy this mosque", match: :first }

    assert_text "Mosque was successfully destroyed"
  end
end

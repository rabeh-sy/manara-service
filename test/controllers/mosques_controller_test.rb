require "test_helper"

class MosquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mosque = mosques(:one)
  end

  test "should get index" do
    get mosques_url
    assert_response :success
  end

  test "should get new" do
    get new_mosque_url
    assert_response :success
  end

  test "should create mosque" do
    assert_difference("Mosque.count") do
      post mosques_url, params: { mosque: { capacity: @mosque.capacity, description: @mosque.description, establish_year: @mosque.establish_year, latitude: @mosque.latitude, location: @mosque.location, longitude: @mosque.longitude, name: @mosque.name, size: @mosque.size, status: @mosque.status } }
    end

    assert_redirected_to mosque_url(Mosque.last)
  end

  test "should show mosque" do
    get mosque_url(@mosque)
    assert_response :success
  end

  test "should get edit" do
    get edit_mosque_url(@mosque)
    assert_response :success
  end

  test "should update mosque" do
    patch mosque_url(@mosque), params: { mosque: { capacity: @mosque.capacity, description: @mosque.description, establish_year: @mosque.establish_year, latitude: @mosque.latitude, location: @mosque.location, longitude: @mosque.longitude, name: @mosque.name, size: @mosque.size, status: @mosque.status } }
    assert_redirected_to mosque_url(@mosque)
  end

  test "should destroy mosque" do
    assert_difference("Mosque.count", -1) do
      delete mosque_url(@mosque)
    end

    assert_redirected_to mosques_url
  end
end

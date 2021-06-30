require "test_helper"

class TestDrivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_drife = test_drives(:one)
  end

  test "should get index" do
    get test_drives_url
    assert_response :success
  end

  test "should get new" do
    get new_test_drife_url
    assert_response :success
  end

  test "should create test_drife" do
    assert_difference('TestDrive.count') do
      post test_drives_url, params: { test_drife: {  } }
    end

    assert_redirected_to test_drife_url(TestDrive.last)
  end

  test "should show test_drife" do
    get test_drife_url(@test_drife)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_drife_url(@test_drife)
    assert_response :success
  end

  test "should update test_drife" do
    patch test_drife_url(@test_drife), params: { test_drife: {  } }
    assert_redirected_to test_drife_url(@test_drife)
  end

  test "should destroy test_drife" do
    assert_difference('TestDrive.count', -1) do
      delete test_drife_url(@test_drife)
    end

    assert_redirected_to test_drives_url
  end
end

require 'test_helper'

class RunsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get runs_show_url
    assert_response :success
  end

end

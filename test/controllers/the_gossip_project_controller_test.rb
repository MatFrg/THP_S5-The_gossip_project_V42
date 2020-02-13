require 'test_helper'

class TheGossipProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get the_gossip_project_team_url
    assert_response :success
  end

end

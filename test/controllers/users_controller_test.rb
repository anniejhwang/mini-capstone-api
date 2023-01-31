require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response 201
    end
  end

  test "show" do
    get "/users/#{User.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["name", "email", "password", "password_confirmation", "created_at", "updated_at"], data.keys
  end
end

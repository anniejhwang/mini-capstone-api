require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/orders.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Order.count, data.length
  end
end
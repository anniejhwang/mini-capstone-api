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

  test "create" do
    assert_difference "Order.count", 1 do
      post "/orders.json", params: { id: "1", user_id: "1", product_id: 1, quantity: "4", subtotal: "1", tax: "1", total: "1" }
      assert_response 200
    end
  end

  test "show" do
    get "/orders/#{Order.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "product_id", "quantity", "subtotal", "tax", "total", "created_at", "updated_at"], data.keys
  end
end

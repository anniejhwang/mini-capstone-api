require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password")
    @order = Order.create(user_id: @user.id, product_id: Product.first.id, quantity: 10)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/orders.json", headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Order.count, data.length
  end

  test "create" do
    assert_difference "Order.count", 1 do
      post "/orders.json", 
      params: { id: "1", user_id: "1", product_id: 1, quantity: "4", subtotal: "1", tax: "1", total: "1" }, , headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end

  test "show" do
    get "/orders/#{Order.first.id}.json", , headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "product_id", "quantity", "subtotal", "tax", "total", "created_at", "updated_at"], data.keys
  end
end

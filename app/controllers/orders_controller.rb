class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    subtotal = quantity * product.price
    tax = quantity * product.tax
    total = subtotal + tax

    @order = Order.create!(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    render :show
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])

    if @order
      :show
    else
      render json: {}, status: :unauthorized
    end
  end

  def index
    @orders = current_user.orders

    :index
  end
end

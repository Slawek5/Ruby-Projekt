class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]


  def index
    @orders = Order.all
  end


  def show
  end


  def new
    @order = Order.new
  end


  def edit
  end


  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "
Zamówienie zostało pomyślnie utworzone." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Zamówienie zostało pomyślnie zaktualizowane." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_path, status: :see_other, notice: "Zamówienie zostało pomyślnie zniszczone." }
      format.json { head :no_content }
    end
  end

  private

    def set_order
      @order = Order.find(params.expect(:id))
    end


  def order_params
    params.require(:order).permit(:customer_id, :status, :ordered_at, :shipped_at, part_ids: [])
  end
end

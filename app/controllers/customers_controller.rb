class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]


  def index
    @customers = Customer.all
  end


  def show
  end


  def new
    @customer = Customer.new
  end


  def edit
  end


  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: "Klient został pomyślnie utworzony." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: "Klient został pomyślnie zaktualizowany." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @customer.destroy!

    respond_to do |format|
      format.html { redirect_to customers_path, status: :see_other, notice: "Klient został pomyślnie usunięty." }
      format.json { head :no_content }
    end
  end

  private

    def set_customer
      @customer = Customer.find(params.expect(:id))
    end


    def customer_params
      params.expect(customer: [ :name, :email, :role, :phone_number, :address ])
    end
end

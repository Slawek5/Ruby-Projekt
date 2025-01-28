class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: %i[ show edit update destroy ]


  def index
    @manufacturers = Manufacturer.all
  end


  def show
  end


  def new
    @manufacturer = Manufacturer.new
  end


  def edit
  end


  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to @manufacturer, notice: "Producent został pomyślnie utworzony." }
        format.json { render :show, status: :created, location: @manufacturer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        format.html { redirect_to @manufacturer, notice: "Producent został pomyślnie zaktualizowany." }
        format.json { render :show, status: :ok, location: @manufacturer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @manufacturer.destroy!

    respond_to do |format|
      format.html { redirect_to manufacturers_path, status: :see_other, notice: "Manufacturer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_manufacturer
      @manufacturer = Manufacturer.find(params.expect(:id))
    end


    def manufacturer_params
      params.expect(manufacturer: [ :name, :description ])
    end
end

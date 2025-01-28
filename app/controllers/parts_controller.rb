class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]


  def index
    @parts = Part.all
  end


  def show
  end


  def new
    @part = Part.new
  end


  def edit
  end


  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: "
Część została pomyślnie utworzona." }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part, notice: "Część została pomyślnie zaktualizowana." }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @part.destroy!

    respond_to do |format|
      format.html { redirect_to parts_path, status: :see_other, notice: "Część została pomyślnie zniszczona." }
      format.json { head :no_content }
    end
  end

  private

  def set_part
    @part = Part.find(params.require(:id))
  end


  def part_params
    params.require(:part).permit(:title, :sku, :description, :status, :category_id)
  end
end

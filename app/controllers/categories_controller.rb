class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]


  def index
    @categories = Category.all
  end


  def show
  end


  def new
    @category = Category.new
  end


  def edit
  end


  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Kategoria została pomyślnie utworzona." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Kategoria została pomyślnie zaktualizowana." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @category = Category.find(params[:id])


    @category.parts.destroy_all

    @category.destroy
    redirect_to categories_path, notice: "Kategoria została pomyślnie usunięta."
  end


  private

    def set_category
      @category = Category.find(params.expect(:id))
    end


    def category_params
      params.expect(category: [ :name, :description ])
    end
end

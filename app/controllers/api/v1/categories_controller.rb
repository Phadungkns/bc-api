# frozen_string_literal: true

class Api::V1::CategoriesController < Api::ApplicationController
  before_action :set_category, only: %i[show update destroy]

  # GET /api/v1/categories
  def index
    categories = Category.all
    render json: categories, status: :ok
  end

  # GET /api/v1/categories/:id
  def show
    render json: @category, status: :ok
  end

  # POST /api/v1/categories
  def create
    category = Category.new(category_params)

    if category.save
      render json: category, status: :created
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/categories/:id
  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/categories/:id
  def destroy
    if @category.destroy
      render json: { message: 'Category deleted successfully' }, status: :ok
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

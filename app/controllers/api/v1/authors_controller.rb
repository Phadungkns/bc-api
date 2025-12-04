# frozen_string_literal: true

class Api::V1::AuthorsController < Api::ApplicationController
  before_action :set_author, only: %i[show update destroy]

  # GET /api/v1/authors
  def index
    authors = Author.all
    render json: authors, status: :ok
  end

  # GET /api/v1/authors/:id
  def show
    render json: @author, status: :ok
  end

  # POST /api/v1/authors
  def create
    author = Author.new(author_params)
    if author.save
      render json: author, status: :created
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/authors/:id
  def update
    if @author.update(author_params)
      render json: @author, status: :ok
    else
      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/authors/:id
  def destroy
    if @author.destroy
      render json: { message: 'Author deleted successfully' }, status: :ok
    else
      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end

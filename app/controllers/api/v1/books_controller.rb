# frozen_string_literal: true

class Api::V1::BooksController < Api::ApplicationController
  before_action :set_book, only: %i[show update destroy]

  # GET /api/v1/books
  def index
    books = Book.includes(:authors, :category)
    render json: books, include: %i[authors category], status: :ok
  end

  # GET /api/v1/books/:id
  def show
    render json: @book, include: %i[authors category], status: :ok
  end

  # POST /api/v1/books
  def create
    book = Book.new(book_params)

    if book.save
      update_book_authors(book)
      render json: book, include: %i[authors category], status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/books/:id
  def update
    if @book.update(book_params)
      render json: @book, include: %i[authors category], status: :ok
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/books/:id
  def destroy
    if @book.destroy
      render json: { message: 'Book deleted successfully' }, status: :ok
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :category_id, author_ids: [])
  end
end

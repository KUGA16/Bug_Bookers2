class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorite.new(book.id: book_id)
    favorite.save
    redirect_to :back
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorite.find_by(book.id: book_id)
    favorite.destoy
    redirect_to :back
  end

end

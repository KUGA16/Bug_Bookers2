class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
      redirect_back(fallback_location: root_path)
    else
      @user = @book.user
      @new_book = Book.new
      render "books/show"
    end
  end

  def destroy
    book_comment = BookComment.find(params[:book_id])
    if book_comment.user_id == current_user.id
       book_comment.destroy
       redirect_back(fallback_location: root_path)
    else
      redirect_to 'root_path'
    end
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:user_id,:book_id,:comment)
  end

end

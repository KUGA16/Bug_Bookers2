class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    if @book_comment.save
      flash[:success] = "Comment was successfully created."
      # redirect_back(fallback_location: root_path)
    else
      # @book_comments = BookComment.where(id: @book)
      render "books/show"
    end
  end

  def destroy
    @book_comment = BookComment.find(params[:book_id])
    @book = @book_comment.book
    if @book_comment.user == current_user
       @book_comment.destroy
       # redirect_back(fallback_location: root_path)
    else
      redirect_to 'root_path'
    end
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end


end

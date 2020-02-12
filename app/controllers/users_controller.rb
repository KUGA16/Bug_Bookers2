class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :baria_user, only: [:edit, :update]
	before_action :user_find, only: [:show,:edit,:update,:follows,:followers]

  def show
  	# @user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
		@room = Room.new

  end

  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
	end

  def edit
  	# @user = User.find(params[:id])
  end

  def update
  	# @user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
  	else
  		render "edit"
  	end
  end

	def follows
		# @user = User.find(params[:id])
		@users = @user.followings
	end

	def followers
		# @user = User.find(params[:id])
		@users = @user.followers
	end



  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
  def baria_user
			 user = User.find(params[:id])
  	unless user.id == current_user.id
  		redirect_to user_path(current_user)
  	end
  end

	def user_find
		@user = User.find(params[:id])
	end
end

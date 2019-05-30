class UsersController < ApplicationController

  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def index
  	@user = current_user
  	@users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.save
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have creatad user info successfully."
    end
  end

  private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
end

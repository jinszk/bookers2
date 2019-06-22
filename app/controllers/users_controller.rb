class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

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
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have creatad user info successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end

    def correct_user
        @user = User.find(params[:id])
        if current_user != @user
          redirect_to user_path(current_user)
        end
    end
end

class UsersController < ApplicationController
  before_action :baria_user, except: %i[show]
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '編集が完了しました！'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :reset_password_token, :name, :introduction, :image)
  end

  def baria_user
    redirect_to root_path unless params[:id].to_i == current_user.id
  end
end

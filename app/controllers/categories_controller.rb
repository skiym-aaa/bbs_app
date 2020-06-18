class CategoriesController < ApplicationController

  before_action :authenticate_user!

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to request.referer, notice: "カテゴリーの作成が完了しました！"
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to request.referer, notice: "カテゴリーの作成が完了しました！"
    else
      # FIXME: renderが失敗する
      redirect_to request.referer
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

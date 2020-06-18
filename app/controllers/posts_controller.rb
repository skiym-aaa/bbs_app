class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = @q.result
  end

  def show
    @post = Post.find(params[:id])
    @post_response = PostResponse.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "新規投稿に成功しました！"
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :article_url, category_ids: [])
  end

end

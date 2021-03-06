class PostResponsesController < ApplicationController

  def create
    @post_response = PostResponse.new(post_response_params)
    @post_response.post_id = params[:post_id]
    if @post_response.save
      redirect_to request.referrer
    else
      # FIXME: renderが失敗する
      redirect_to request.referer
    end
  end

  def post_response_params
    params.require(:post_response).permit(:post_id, :body, :name, :email)
  end
end

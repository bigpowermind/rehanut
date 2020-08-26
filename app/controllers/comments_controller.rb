class CommentsController < ApplicationController
  before_action :set_group

  def index
    @comment = Comment.new
    @comments = @content.comments.includes(:user)
  end

  def create
    @comment = @content.comments.new(comment_params)
    if @comment.save
      redirect_to content_comments_path(@content), notice: "メッセージが送信されました"
    else
      @comments = @content.comments.includes(:user)
      flash.now[:alert] = "メッセージを入力してください"
      #render template: "contents/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, content_id: params[:content_id])
  end

  def set_group
    @content = Content.find(params[:content_id])
  end
end

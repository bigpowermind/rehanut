class CommentsController < ApplicationController
  before_action :set_content

  def index
    @comment = Comment.new
    @comments = @content.comments.includes(:user)
  end

  def create
    @comment = @content.comments.new(comment_params)
    if @comment.save!
      redirect_to content_comments_path(@content), notice: "メッセージが送信されました"
    else
      @comments = @content.comments.includes(:user)
      flash.now[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :image).merge(user_id: current_user.id)
  end

  def set_content
    @content = Content.find(params[:content_id])
  end
end
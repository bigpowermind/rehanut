class CommentsController < ApplicationController
  

  # def index
  #   @comment = Comment.new
  #   @comments = @content.comments.includes(:user)
  # end

  def create
    comment = Comment.create(comment_params)
    redirect_to content_path(current_user) #"/contents/#{comment.content.id}"
    # @comment = @content.comments.new(comment_params)
    # if @comment.save
    #   redirect_to content_path(@content), notice: "メッセージが送信されました"
    # else
    #   @comments = @content.comments.includes(:user)
    #   flash.now[:alert] = "メッセージを入力してください"
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :image).merge(user_id: current_user.id, content_id: params[:content_id])
  end

  
end

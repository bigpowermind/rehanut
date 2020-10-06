class ContentsController < ApplicationController
  # before_action :set_group, only: :show

  def index
    @contents = Content.all
  end

  def show
    @contents = Content.all
    # @comment = Comment.new
    # @comments = @content.comments.includes(:user)
  end

  
  

  def nut
    @contents = Content.all
  end

  private

  # def set_group
  #   @content = Content.find(params[:id]).merge(user_id: current_user.id)
  # end
end

# ログインが違えばコメントができなくなっている。
# set_group,showアクションのid修正が必要！！
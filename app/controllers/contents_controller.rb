class ContentsController < ApplicationController

  def index
    @contents = Content.all
  end

  def show
    @contents = Content.find(2)
    @comment = Comment.new
    @comments = @contents.comments.includes(:user)
  end

  def nut
    @contents = Content.all
  end
end

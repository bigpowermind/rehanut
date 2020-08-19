class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
    @contents = Content.all
  end
end

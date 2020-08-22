class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
    @contents = Content.find(2)
  end

  def nut
    @contents = Content.all
  end
end

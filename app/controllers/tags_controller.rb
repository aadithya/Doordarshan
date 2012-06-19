class TagsController < ApplicationController
  def new
  end
  def show
  @tags = Tag.find(params[:id])
  end
  def index
  end
end
end

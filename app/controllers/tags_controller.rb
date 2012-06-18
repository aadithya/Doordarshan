class TagsController < ApplicationController
  def new
  end
  def show
  @tags = Tag.find(params[:id])
  end
  def index
	@tags = Tag.find(:all,:conditions => ['name LIKE ?', "#{params[:q]}%"],  :limit => 5, :order => 'name')
	respond_to do |format|
	format.html # index.html.erb
	format.xml  { render :xml => @tags }
	format.js # index.js.erb
	#format.json { render :json => @tags }
  end
end
end

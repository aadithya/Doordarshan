class ProgramsController < ApplicationController
def search_results
if params[:channel] == "true"
  @programs = Program.where("channel = '#{params[:search]}'").paginate(:page => params[:page])
else
  @programs = Program.search params[:search], params[:page]
end
end
end

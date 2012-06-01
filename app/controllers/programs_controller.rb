class ProgramsController < ApplicationController
def search_results
if params[:channel] == "true"
  @programs = Program.find_all_by_channel(params[:search])
else
  @programs = Program.search params[:search]
end
end
end

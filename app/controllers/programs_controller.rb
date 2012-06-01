class ProgramsController < ApplicationController
def search_results
  @programs = Program.search params[:search]
end
end


class ProgramGenresController < ApplicationController
  # GET /program_genres
  # GET /program_genres.json
  def index
    @program_genres = ProgramGenre.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @program_genres }
    end
  end

  # GET /program_genres/1
  # GET /program_genres/1.json
  def show
    @program_genre = ProgramGenre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @program_genre }
    end
  end

  # GET /program_genres/new
  # GET /program_genres/new.json
  def new
    @program_genre = ProgramGenre.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program_genre }
    end
  end

  # GET /program_genres/1/edit
  def edit
    @program_genre = ProgramGenre.find(params[:id])
  end

  # POST /program_genres
  # POST /program_genres.json
  def create
    @program_genre = ProgramGenre.new(params[:program_genre])

    respond_to do |format|
      if @program_genre.save
        format.html { redirect_to @program_genre, notice: 'Program genre was successfully created.' }
        format.json { render json: @program_genre, status: :created, location: @program_genre }
      else
        format.html { render action: "new" }
        format.json { render json: @program_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /program_genres/1
  # PUT /program_genres/1.json
  def update
    @program_genre = ProgramGenre.find(params[:id])

    respond_to do |format|
      if @program_genre.update_attributes(params[:program_genre])
        format.html { redirect_to @program_genre, notice: 'Program genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @program_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_genres/1
  # DELETE /program_genres/1.json
  def destroy
    @program_genre = ProgramGenre.find(params[:id])
    @program_genre.destroy

    respond_to do |format|
      format.html { redirect_to program_genres_url }
      format.json { head :no_content }
    end
  end
end

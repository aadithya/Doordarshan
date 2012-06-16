
class ProgramsController < ApplicationController
  require 'gmail'

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all(:include => :category)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @programs }
    end
  end

  def search_results
    query = '%' + (params[:search].upcase.gsub /s+/, "%") + '%'
    # TODO: All we need here is the count(subscribers)
    # Find a better way to get this
    @programs = Program.find(:all,
      :conditions => "UPPER(title) LIKE '#{query}'",
      :include => [:category, :users]).paginate(:page => params[:page])

    @subscribedPrograms = SubscribeList.find(:all,
      :select => "program_id",
      :conditions => ["user_id = ?", "#{current_user.id}"])

    # TODO: there has to be a better way to create hash list
    @currentSubscriptions = Hash.new
    @subscribedPrograms.each do |s|
      @currentSubscriptions["#{s.program_id}"] = s.program_id
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @programs }
    end
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @program }
    end
  end

  # GET /programs/new
  # GET /programs/new.json
  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end
  end

  # GET /programs/1/edit
  def edit
    @program = Program.find(params[:id])
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(params[:program])

    respond_to do |format|
      if @program.save(:without_protection => true)
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render json: @program, status: :created, location: @program }
      else
        format.html { render action: "new" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /programs/1
  # PUT /programs/1.json
  def update
    @program = Program.find(params[:id])

    respond_to do |format|
      if @program.update_attributes(params[:program], :without_protection => true)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  def subscribe
    SubscribeList.create(:user_id => current_user.id, :program_id => params[:program]) 
    send_subscribed(params[:program],current_user)
    redirect_to :back
  end

  def unsubscribe
    subscription = SubscribeList.find_by_user_id_and_program_id( current_user.id,  params[:program]) 
    subscription.delete()
    redirect_to :back
  end

end

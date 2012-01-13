class StoryStatusesController < ApplicationController
  # GET /story_statuses
  # GET /story_statuses.json
  def index
    @story_statuses = StoryStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @story_statuses }
    end
  end

  # GET /story_statuses/1
  # GET /story_statuses/1.json
  def show
    @story_status = StoryStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @story_status }
    end
  end

  # GET /story_statuses/new
  # GET /story_statuses/new.json
  def new
    @story_status = StoryStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @story_status }
    end
  end

  # GET /story_statuses/1/edit
  def edit
    @story_status = StoryStatus.find(params[:id])
  end

  # POST /story_statuses
  # POST /story_statuses.json
  def create
    @story_status = StoryStatus.new(params[:story_status])

    respond_to do |format|
      if @story_status.save
        format.html { redirect_to @story_status, :notice => 'Story status was successfully created.' }
        format.json { render :json => @story_status, :status => :created, :location => @story_status }
      else
        format.html { render :action => "new" }
        format.json { render :json => @story_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /story_statuses/1
  # PUT /story_statuses/1.json
  def update
    @story_status = StoryStatus.find(params[:id])

    respond_to do |format|
      if @story_status.update_attributes(params[:story_status])
        format.html { redirect_to @story_status, :notice => 'Story status was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @story_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /story_statuses/1
  # DELETE /story_statuses/1.json
  def destroy
    @story_status = StoryStatus.find(params[:id])
    @story_status.destroy

    respond_to do |format|
      format.html { redirect_to story_statuses_url }
      format.json { head :ok }
    end
  end
end

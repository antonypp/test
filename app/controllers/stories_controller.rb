class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])
    @story_comment = StoryComment.new
    @story_comment.story_id = @story.id
    @story_comments = StoryComment.find_all_by_story_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new
    @story_statuses = StoryStatus.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
    @story_statuses = StoryStatus.all
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])
    @story.user_id = self.current_user.id
    #@StoryStatus = StoryStatus.find(1)
   # @story.story_status_id = @StoryStatus.id
    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, :notice => 'Story was successfully created.' }
        format.json { render :json => @story, :status => :created, :location => @story }
      else
        format.html { render :action => "new" }
        format.json { render :json => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])
    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, :notice => 'Story was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :ok }
    end
  end
end

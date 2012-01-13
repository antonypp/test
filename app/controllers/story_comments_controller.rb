class StoryCommentsController < ApplicationController
  # GET /story_comments
  # GET /story_comments.json
  def index
    @story_comments = StoryComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @story_comments }
    end
  end

  # GET /story_comments/1
  # GET /story_comments/1.json
  def show
    @story_comment = StoryComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @story_comment }
    end
  end

  # GET /story_comments/new
  # GET /story_comments/new.json
  def new
    @story_comment = StoryComment.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @story_comment }
    end
  end

  
  # POST /story_comments
  # POST /story_comments.json
  def create
    @story_comment = StoryComment.new(params[:story_comment])
    @story_comment.user_id = self.current_user.id
    @story = Story.find(params[:story_comment][:story_id])
    @story_comment.story_id = @story.id
    respond_to do |format|
      if @story_comment.save
        format.html { redirect_to @story, :notice => 'Story comment was successfully created.' }
        format.json { render :json => @story_comment, :status => :created, :location => @story_comment }
      else
        format.html { render @story , :notice => 'error' }
        format.json { render :json => @story_comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /story_comments/1
  # DELETE /story_comments/1.json
  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story_comment.destroy

    respond_to do |format|
      format.html { redirect_to story_comments_url }
      format.json { head :ok }
    end
  end
end

class DiscussionsController < ApplicationController

  # INESCUD

  def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

  def create
    @discussion = Discussion.new(discussion_params)
    if @discussion.save
      flash[:notice] = "This discussion was created."
      redirect_to @discussion
    else
      render 'new'
    end
  end

  def update
    @discussion = Discussion.find(params[:id])
    if @discussion.update_attributes(discussion_params)
      flash[:notice] = "The discussion was updated."
      redirect_to @discussion
    else
      render 'new'
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    if @discussion.destroy
      flash[:notice] = "This discussion was deleted."
      render :index
    else
      flash[:alert] = "Discussion deletion failed."
      render :show
    end
  end

  private

    def discussion_params
      params.require(:discussion).permit(:title, :description)
    end

end

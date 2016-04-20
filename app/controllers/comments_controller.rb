saclass CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @comment = @workout.comments.create(comment_params)
    if @comment.save
    else
      flash[:answer] = "Cannot create a comment"
    end
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

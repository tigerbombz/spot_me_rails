class WorkoutsController < ApplicationController
  def index
  end

  def new
    @workout = Workout.new
  end

  def show
    @workout = Workout.find(params[:id])
    @comments = Comment.where(workout_id: @workout.id)
    @comment = Comment.new

    @tag = Tag.new
    name = params[:name]
    tag = Tag.find_by(name: name)
    if tag
      @workouts = tag.workouts
    end
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to '/users/new'
    else
      flash[:errors] = @workout.errors.full_messages
      redirect_to :back
    end
  end


  private
  def workout_params
    puts params
    params.require(:workout).permit(:title, :bio, :url, :content).merge(user: current_user)
  end
end

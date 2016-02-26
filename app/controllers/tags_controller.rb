class TagsController < ApplicationController

  def index
    name = params[:name]
    tag = Tag.find_by(name: name)
    if tag
      @workouts = tag.workouts
    else
      @workouts = []
    end
  end

  def new
    @tag = Tag.new
  end

  def show
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      workout = Workout.find(params[:workout_id])
      workout.workout_tags.create!(tag_id: @tag.id)
      redirect_to tags_path(name: @tag.name)
    else
      flash[:error] = 'That tag name is already taken'
      redirect_to :back
    end
  end

  def search
    @tags = Tag.all
    @search = Tag.find_by(name: @tags.name)
      if params[:name] == @search
      end
      redirect_to '/tags/new'
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end

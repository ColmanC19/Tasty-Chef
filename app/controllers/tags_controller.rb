class TagsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @tag = @recipe.tags.new
    render :new
  end

  def create
  @recipe = Recipe.find(params[:recipe_id])
  @tag = @recipe.tags.new(tag_params)
  if @tag.save
    redirect_to recipe_path(@recipe)
  else
    render :new
  end
end

def show
  @recipe = Recipe.find(params[:recipe_id])
  @tag = Tag.find(params[:id])
  render :show
end

def edit
  @recipe = Recipe.find(params[:recipe_id])
  @tag = Tag.find(params[:id])
  render :edit
end

def update
  @tag = Tag.find(params[:id])
  if @tag.update(tag_params)
    redirect_to recipe_path(@tag.recipe)
  else
    render :edit
  end
end

def destroy
  @tag = Tag.find(params[:id])
  @tag.destroy
  redirect_to recipe_path(@tag.recipe)
end

# Other controller actions go here.

private
  def tag_params
    params.require(:tag).permit(:name)
  end

end

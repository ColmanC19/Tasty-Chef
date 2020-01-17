class TagsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @tag = @recipe.tags.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.new(tag_params)
    @tags = @recipe.tags.new(tag_params)
    if @tag.save
      @recipe.tags << @tag
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
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to recipe_path(@recipe)
  end

  # Other controller actions go here.

  private
  def tag_params
    params.require(:tag).permit(:name, :ingredient)
  end

end

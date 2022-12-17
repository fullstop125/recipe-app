class RecipesController < ApplicationController
  load_and_authorize_resource except: %i[public]
  before_action :authenticate_user!

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @user = current_user
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: @recipe.id)
  end

  # GET /recipes/new or /recipes/new.json
  def new
    @recipe = Recipe.new
  end

  # Post /recipes or /recipes.json
  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
      flash[:notice] = 'Recipe was successfully created.'
    else
      render 'new'
      flash[:alert] = 'Recipe was not created.'
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.public == true
      @recipe.update(public: false)
    else
      Recipe.find(@recipe.id).update(public: true)
    end
    redirect_to recipe_path(@recipe.id), notice: 'Public Updated'
  end

  # Delete /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
    flash[:notice] = 'Recipe was successfully deleted.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name, :preparation_time, :cooking_time,
      :description, :public, current_user.id
    )
  end
end

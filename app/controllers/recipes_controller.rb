class RecipesController < ApplicationController
  before_action :authenticate_user!

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/new or /recipes/new.json
  def new
    @recipe = Recipe.new
  end

  # Post /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    @recipe.user = @user

    puts @recipe.inspect.to_s

    if @recipe.save
      redirect_to @recipe
      flash[:notice] = "Recipe was successfully created."
    else
      render 'new'
      flash[:alert] = "Recipe was not created."
    end
  end

  private
   def recipe_params
     params.require(:recipe).permit(
        :name, :preparation_time, :cooking_time, 
        :description, :public, :user_id)
   end
end

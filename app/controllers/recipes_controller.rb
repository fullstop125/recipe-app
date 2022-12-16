class RecipesController < ApplicationController
  load_and_authorize_resource
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
    @recipe = Recipe.new(
      name: recipe_params[:name],
      preparation_time: recipe_params[:preparation_time],
      cooking_time: recipe_params[:cooking_time],
      description: recipe_params[:description],
      public: recipe_params[:public],
      user_id: current_user.id
    )

    if @recipe.save
      redirect_to @recipe
      flash[:notice] = 'Recipe was successfully created.'
    else
      render 'new'
      flash[:alert] = 'Recipe was not created.'
    end
  end

  # Delete /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
    flash[:notice] = 'Recipe was successfully deleted.'
  end

  # GET /public_recipes
  def public
    @recipes = Recipe.where(public: true).order('created_at DESC')
    @username = user_signed_in? ? current_user.name : 'Guest'
    @total_foods = Food.count
    @total_prices = Food.sum(:price)
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name, :preparation_time, :cooking_time,
      :description, :public
    )
  end
end

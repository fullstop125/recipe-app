class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = current_user.recipes_foods.select(:food_id, 'SUM(quantity) as quantity').group(:food_id, :quantity)
    @sum = 0
    @foods.each do |food|
      @sum += food.quantity * food.food.price
    end
  end

  def create
    @recipes_foods = RecipeFood.where('food_id = :x and recipe_id = :y',
                                      x: recipes_foods_params[:food_id], y: recipes_foods_params[:recipe_id])

    if @recipes_foods.size.zero?
      @recipes_foods = RecipeFood.new(recipes_foods_params)
    else
      @recipes_foods.update(recipes_foods_params)
      redirect_to recipe_url(@recipes_foods[0].recipe) and return
    end

    respond_to do |format|
      if @recipes_foods.save
        format.html { redirect_to recipe_url(@recipes_foods.recipe), notice: 'Ingredient was successfully saved.' }
        format.json { render :show, status: :created, location: @recipes_foods.recipe }
      else
        format.html { redirect_to new_recipe_recipe_food_url, notice: 'Ingredient was not successfully saved.' }
        format.json { render json: @recipes_foods.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @foods = Food.all
    @food_items = []
    @foods.each do |food|
      @food_items << [food.name, food.id]
    end
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @user = current_user
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  # Only allow a list of trusted parameters through.
  def recipes_foods_params
    params.require(:@recipe_food).permit(:food_id, :quantity, :recipe_id)
  end
end

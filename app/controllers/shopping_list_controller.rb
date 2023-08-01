class ShoppingListController < ApplicationController
  def index
    @recipes = current_user.recipies.includes(recipe_foods: :food)
    @recipe_foods = @recipes.map(&:recipe_foods).flatten
  end
end

class ShoppingListController < ApplicationController
  def index
    @recipies = Recipe.where(user_id: current_user.id)
    @foods1 = []
    @recipies.each do |recipie|
      @foods1 << Food.joins(:recipe_foods).where(recipe_foods: { recipe_id: recipie.id })
    end
    @foods = @foods1[0]
  end
end

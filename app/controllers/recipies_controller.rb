class RecipiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :public_recipies]
  def index
    @recipies = Recipe.where(user_id: current_user.id)
  end
  def public_recipies
    @public = Recipe.where(public: true).order('created_at DESC')
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      redirect_to recipies_path, notice: 'Recipe was successfully deleted.'
    else
      redirect_to recipies_path, alert: 'There was an error deleting the Recipe.'
    end
  end
end

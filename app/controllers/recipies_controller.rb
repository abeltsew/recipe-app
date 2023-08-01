class RecipiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :public_recipies]
  def index
    @recipies = Recipe.where(user_id: current_user.id)
  end
  def public_recipies
    @public = Recipe.where(public: true).order('created_at DESC')
  end
end

class RecipiesController < ApplicationController
  def public_recipies
    @public = Recipe.where(public: true).order('created_at DESC')
  end
end

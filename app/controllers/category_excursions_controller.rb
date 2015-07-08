class CategoryExcursionsController < ApplicationController
  def show
    @category = CategoryExcursion.includes(excursions: :translations).find(params[:id])
  end
end

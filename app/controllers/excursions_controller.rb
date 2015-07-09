class ExcursionsController < ApplicationController
  def show
    @excursion = Excursion.includes(category_excursions: :translations).find(params[:id])
  end
end

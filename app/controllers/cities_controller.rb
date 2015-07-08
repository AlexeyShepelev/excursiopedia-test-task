class CitiesController < ApplicationController
  def index
    cities_list = CitiesListQuery.new.all
    @cities = CityPresenter.collection(cities_list)
  end

  def show
    @city = City.includes(excursions: [:translations, category_excursions: :translations]).find(params[:id])
  end
end

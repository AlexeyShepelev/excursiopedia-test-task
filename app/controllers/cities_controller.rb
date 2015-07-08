class CitiesController < ApplicationController
  def index
    cities_list = CitiesListQuery.new.all
    @cities = CityPresenter.collection(cities_list)
  end
end

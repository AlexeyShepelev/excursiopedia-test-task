class ExcursionsController < ApplicationController
  def show
    @excursion = Excursion.find(params[:id])
  end
end

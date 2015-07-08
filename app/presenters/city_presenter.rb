class CityPresenter < SimpleDelegator
  def self.collection(items)
    items.collect!{ |item| CityPresenter.new(item) }
  end

  def limited_excursions
    object.excursions.first(Settings.cities.excursions_limit)
  end

  private

  def object
    __getobj__
  end
end

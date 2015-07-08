class CitiesListQuery
  def initialize(relation = City)
    @relation = relation
  end

  def all
    @relation.joins(:excursions).eager_load(:translations, excursions: :translations).all
  end
end

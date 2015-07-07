class CategoryExcursion < ActiveRecord::Base
  translates :name
  has_and_belongs_to_many :excursions
end

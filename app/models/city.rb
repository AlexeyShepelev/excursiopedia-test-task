class City < ActiveRecord::Base
  translates :name
  has_many :excursions
end

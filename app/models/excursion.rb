class Excursion < ActiveRecord::Base
  has_paper_trail
  translates :title, :description

  belongs_to :city
  has_and_belongs_to_many :category_excursions

  scope :undescribed, -> { with_translations.where(description: ['', nil]) }
end

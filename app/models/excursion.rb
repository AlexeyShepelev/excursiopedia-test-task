class Excursion < ActiveRecord::Base
  default_scope { published }

  has_paper_trail
  translates :title, :description

  belongs_to :city
  has_and_belongs_to_many :category_excursions

  scope :published, -> { where(published: true) }
  scope :undescribed, -> { with_translations.where(description: ['', nil]) }

  alias_attribute :name, :title
end

class CategoryExcursionsExcursions < ActiveRecord::Migration
  def change
    create_table :category_excursions_excursions do |t|
      t.references :excursion, :category_excursion, index: true
      t.timestamps null: false
    end
  end
end

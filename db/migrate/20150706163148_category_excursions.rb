class CategoryExcursions < ActiveRecord::Migration
  def up
    create_table :category_excursions do |t|
      t.timestamps null: false
    end

    CategoryExcursion.create_translation_table!(name: { type: :string, null: false })
  end

  def down
    drop_table :category_excursions
    CategoryExcursion.drop_translation_table!
  end
end

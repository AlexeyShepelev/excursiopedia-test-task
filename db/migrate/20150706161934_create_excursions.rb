class CreateExcursions < ActiveRecord::Migration
  def up
    create_table :excursions do |t|
      t.boolean :published, null: false, default: false
      t.references :city, index: true
      t.timestamps null: false
    end

    Excursion.create_translation_table!(title: { type: :string }, description: { type: :text })
  end

  def down
    drop_table :excursions
    Excursion.drop_translation_table!
  end
end

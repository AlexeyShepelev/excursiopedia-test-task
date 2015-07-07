class CreateCities < ActiveRecord::Migration
  def up
    create_table :cities do |t|
      t.timestamps null: false
    end
    City.create_translation_table!(name: { type: :string, null: false })
  end

  def down
    drop_table :cities
    City.drop_translation_table!
  end
end

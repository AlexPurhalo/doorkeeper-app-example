class CreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.references :user, foreign_key: true
      t.string :temps
      t.string :name
      t.string :pressure
      t.string :humidities
      t.string :lon
      t.string :lat

      t.timestamps
    end
  end
end

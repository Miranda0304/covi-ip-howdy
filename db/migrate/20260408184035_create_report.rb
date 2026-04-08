class CreateReport < ActiveRecord::Migration[8.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :city
      t.string :state
      t.string :country
      t.date :date
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end

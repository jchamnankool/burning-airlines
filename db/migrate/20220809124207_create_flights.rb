class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.text :name
      t.date :date
      t.text :to
      t.text :from
      t.text :plane
      t.text :seats, array: true, default: []

      t.timestamps
    end
  end
end

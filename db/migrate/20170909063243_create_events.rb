class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.boolean :is_actual
      t.integer :duration

      t.timestamps
    end
  end
end

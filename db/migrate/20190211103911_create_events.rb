class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.integer :duration
      t.string :location
      t.integer :price
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

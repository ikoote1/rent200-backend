class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.text :location
      t.text :description
      t.decimal :price
      t.boolean :active
      t.integer :capacity
      t.string :steering
      t.references :owner, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.references :period, null: false, foreign_key: true

      t.timestamps
    end
  end
end

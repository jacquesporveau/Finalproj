class CreateNutrients < ActiveRecord::Migration
  def change
    create_table :nutrients do |t|
      t.string :name
      t.integer :value
      t.string :unit
      t.belongs_to :food, index: true

      t.timestamps
    end
  end
end

class CreateFood < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.float :water
      t.float :energy
      t.float :protein
      t.float :totallipidfat
      t.float :carbohydrate
      t.float :fiber
      t.float :sugars
      t.float :minerals
      t.float :calcium
      t.float :iron
      t.float :magnesium
      t.float :phosphorus
      t.float :potassium
      t.float :sodium
      t.float :zinc
      t.float :vitaminc
      t.float :thiamin
      t.float :riboflavin
      t.float :niacin
      t.float :vitaminb6
      t.float :folate
      t.float :vitaminb12
      t.float :vitamina_iu
      t.float :vitamine
      t.float :vitamind
      t.float :vitamink
      t.float :lipids
      t.float :saturatedfats
      t.float :monounsaturated
      t.float :polyunsaturated
      t.float :trans
      t.float :cholesterol
      t.float :aminoacids
    end
  end
end

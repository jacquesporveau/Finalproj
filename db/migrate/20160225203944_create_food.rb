class CreateFood < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :Name
      t.float :Water
      t.float :Energy
      t.float :Protein
      t.float :Totallipidfat
      t.float :Carbohydrate
      t.float :Fiber
      t.float :Sugars
      t.float :Minerals
      t.float :Calcium
      t.float :Iron
      t.float :Magnesium
      t.float :Phosphorus
      t.float :Potassium
      t.float :Sodium
      t.float :Zinc
      t.float :VitaminC
      t.float :Thiamin
      t.float :Riboflavin
      t.float :Niacin
      t.float :VitaminB6
      t.float :Folate
      t.float :VitaminB12
      t.float :VitaminA_IU
      t.float :VitaminE
      t.float :VitaminD
      t.float :VitaminK
      t.float :Lipids
      t.float :SaturatedFats
      t.float :Monounsaturated
      t.float :Polyunsaturated
      t.float :Trans
      t.float :Cholesterol
      t.float :AminoAcids
    end
  end
end

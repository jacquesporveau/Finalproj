# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

# WATCH CSV NAMING ADDRESS.

# CSV.foreach('/Users/dennismarchand/lighthouse/finalproject/finalproj2/finalproj/db/foodCSV/berries/banana1.csv', encoding: "ISO8859-1") do |row|
#   break if row[0] == "Footnotes"
#   def clean_value(num)
#     num.slice(4, 5000).join(',').encode('UTF-16le', invalid: :replace, replace: '').encode('UTF-8') unless num.nil?
#   end
#   encoded_value = clean_value(row[2])
#   Food.create({Name: row[0][, value: row[2], unit: row[1]})
# end

Food.create([{Name: 'Banana', Water: 46.82, Energy: 56, Protein: 0.68, Totallipidfat: 0.21, Carbohydrate: 14.28, Fiber: 1.6, Sugars: 7.64, Minerals: 0, Calcium: 3, Iron: 0.16, Magnesium: 17, Phosphorus: 14, Potassium: 224, Sodium: 1, Zinc: 0.09, VitaminC: 5.4, Thiamin: 0.019, Riboflavin: 0.046, Niacin: 0.416, VitaminB6: 0.229, Folate: 12, VitaminB12: 0, VitaminA_IU: 40, VitaminE: 0.06, VitaminD: 0, VitaminK: 0.3, Lipids: 0, SaturatedFats: 0.07, Monounsaturated: 0.02, Polyunsaturated: 0.046, Trans: 0, Cholesterol: 0, AminoAcids: 0}, {Name: 'Kale', Water: 46.82, Energy: 56, Protein: 0.68, Totallipidfat: 0.21, Carbohydrate: 14.28, Fiber: 1.6, Sugars: 200, Minerals: 0, Calcium: 3, Iron: 0.16, Magnesium: 17, Phosphorus: 14, Potassium: 224, Sodium: 1, Zinc: 0.09, VitaminC: 5.4, Thiamin: 0.019, Riboflavin: 0.046, Niacin: 0.416, VitaminB6: 0.229, Folate: 12, VitaminB12: 0, VitaminA_IU: 40, VitaminE: 0.06, VitaminD: 0, VitaminK: 0.3, Lipids: 0, SaturatedFats: 0.07, Monounsaturated: 0.02, Polyunsaturated: 0.046, Trans: 0, Cholesterol: 0, AminoAcids: 0}, {Name: 'Water', Water: 46.82, Energy: 56, Protein: 0.68, Totallipidfat: 0.21, Carbohydrate: 14.28, Fiber: 1.6, Sugars: 200, Minerals: 0, Calcium: 3, Iron: 0.16, Magnesium: 17, Phosphorus: 14, Potassium: 224, Sodium: 1, Zinc: 300.09, VitaminC: 5.4, Thiamin: 0.019, Riboflavin: 0.046, Niacin: 0.416, VitaminB6: 0.229, Folate: 12, VitaminB12: 0, VitaminA_IU: 40, VitaminE: 0.06, VitaminD: 0, VitaminK: 0.3, Lipids: 0, SaturatedFats: 0.07, Monounsaturated: 0.02, Polyunsaturated: 0.046, Trans: 0, Cholesterol: 0, AminoAcids: 0}, {Name: 'Chia', Water: 46.82, Energy: 56, Protein: 0.68, Totallipidfat: 0.21, Carbohydrate: 14.28, Fiber: 1.6, Sugars: 200, Minerals: 0, Calcium: 3, Iron: 0.16, Magnesium: 17, Phosphorus: 14, Potassium: 224, Sodium: 1, Zinc: 300.09, VitaminC: 5.4, Thiamin: 0.019, Riboflavin: 0.046, Niacin: 0.416, VitaminB6: 0.229, Folate: 12, VitaminB12: 0, VitaminA_IU: 40, VitaminE: 0.06, VitaminD: 0, VitaminK: 0.3, Lipids: 0, SaturatedFats: 0.07, Monounsaturated: 0.02, Polyunsaturated: 0.046, Trans: 0, Cholesterol: 0, AminoAcids: 0}, {Name: 'Mint', Water: 46.82, Energy: 56, Protein: 0.68, Totallipidfat: 0.21, Carbohydrate: 14.28, Fiber: 1.6, Sugars: 200, Minerals: 0, Calcium: 3, Iron: 0.16, Magnesium: 17, Phosphorus: 14, Potassium: 224, Sodium: 1, Zinc: 300.09, VitaminC: 5.4, Thiamin: 0.019, Riboflavin: 0.046, Niacin: 0.416, VitaminB6: 0.229, Folate: 12, VitaminB12: 0, VitaminA_IU: 40, VitaminE: 0.06, VitaminD: 0, VitaminK: 0.3, Lipids: 0, SaturatedFats: 0.07, Monounsaturated: 0.02, Polyunsaturated: 0.046, Trans: 0, Cholesterol: 0, AminoAcids: 0}])
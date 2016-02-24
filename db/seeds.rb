# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

# WATCH CSV NAMING ADDRESS.

CSV.foreach('/Users/dennismarchand/lighthouse/finalproject/finalproj2/finalproj/db/foodCSV/berries/banana1.csv', encoding: "ISO8859-1") do |row|
  break if row[0] == "Footnotes"
  # def clean_value(num)
  #   num.slice(4, 5000).join(',').encode('UTF-16le', invalid: :replace, replace: '').encode('UTF-8') unless num.nil?
  # end
  # encoded_value = clean_value(row[2])
  Nutrient.create({name: row[0], value: row[2], unit: row[1]})
end

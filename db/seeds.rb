# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

# WATCH CSV NAMING ADDRESS.

require 'csv'
users_csvs = Dir['banana1.csv']
users_csvs.each do |user_file|
  CSV.foreach(user_file, encoding: "ISO8859-1") do |row|
    break if row[0] == "Footnotes"
    puts row[0]
    # def clean_value(num)
    #   num.slice(4, 5000).join(',').encode('UTF-16le', invalid: :replace, replace: '').encode('UTF-8') unless num.nil?
    # end
    # encoded_value = clean_value(row[2])
    Nutrients.create({name: row[0], value: row[2], unit: row[1]})
  end
end
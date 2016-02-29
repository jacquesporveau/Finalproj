require 'pg'
require 'csv'
arr=[]
users_csvs = Dir['./db/foodCSV/vegetables/*1.csv']
users_csvs2 = Dir['./db/foodCSV/berries/*1.csv']
users_csvs3 = Dir['./db/foodCSV/alternate_csv/*1.csv']
puts "starting"
times=0
loop do
# if times < 11
#   users_csvs = users_csvs3
# end
# if times <= 18 && times > 10
#   users_csvs == users_csvs2
# end

if times > 50
  break
end

users_csvs3.each do |user_file|

cleaner_filename = user_file.gsub('1.csv', '').gsub(/.*\//, '')
# conn.prepare('statement1', 'insert into table1 (id, name, profile) values ($1, $2, $3)')
record={} #This will be created to record the column name and its corresponding value
columns_values = [] #This array will store hashes of column names and values
#The loop below will create an Array of Hashes and each Hash will store the column name and its
#corresponding value.

CSV.foreach(user_file, :encoding =>'windows-1251:utf-8') do |row|
  puts user_file.length
  puts cleaner_filename
  if user_file.length >= 50
    break
  end
  if row[0] == "Footnotes"
    break
  end
  if row[0] == "Nutrient"
    good_to_go = true
    next
  end
  if row[2].blank?
    row[2] = 0
  end

    record = { 'column_name'=>row[0],'column_value'=>row[2]}

    valid_keys = [:Water,:Energy,:Protein,:totallipidfat,:carbohydrate,:fiber,:sugars,:Minerals,:calcium,:iron,:magnesium,:phosphorus,:potassium,:sodium,:zinc,:Thiamin,:Riboflavin,:Niacin,:vitaminb6,:vitaminb12,:vitamina_iu,:vitamind,:vitamink,:Lipids,:saturatedFats,:monounsaturated,:polyunsaturated,:Cholesterol,:aminoacids]
    columns_values << record
end


# [0,0,0,0,0,1.24,31,2.19,0.66,5.72,3.3,0,164,9.62,66,30,212,38,0.27,0,0.0,0.032,0.156,0.722,0.284,58,0.00,58,1164,0.0,0,0,0.173,0.023,0.358,0.000,0,0,0]

# CREATE TEMP TABLE tmp_table AS SELECT * FROM newsletter_subscribers;
# COPY tmp_table (na) FROM stdin DELIMITER ' ' CSV;
# SELECT count(*) FROM tmp_table;  -- Just to be sure
# TRUNCATE newsletter_subscribers;
sql = "insert into foods ("
good_to_go = false
# Get all the column names in the SQL statement
columns_values.each_with_index do |row, index|
  if columns_values.length >=42
    row
  end
  puts columns_values.length
    if row["column_name"] == "Nutrient"
      good_to_go = true
      next
    end

   if row["column_name"] == 'Vitamin A, RAE' || row["column_name"] == 'Vitamin E (alpha-tocopherol)' || row["column_name"] == 'Vitamin D (D2 + D3)' || row["column_name"].match(/^\W/) || row["column_name"] == 'Other' || row["column_name"] == "Caffeine" || row["column_name"] == "Footnotes" || row["column_name"] == "Vitamins" || row["column_name"] == "Proximates" || row["column_name"] == "Source: USDA National Nutrient Database for Standard Reference 28 Software v.2.3.7.5" || row["column_name"].match(/:/) || row["column_name"].match(/Report/) || row["column_name"]== "Hexadecenoic acid" || row["column_name"]== "Eicosapentaenoic n-3 acid" || row["column_name"]== "Vitamin A" || row["column_name"]== "Octadecadienoic acid" || row["column_name"]== "Glutamic acid" || row["column_name"]== "Aspartic acid" || row["column_name"]== "Docosahexaenoic n-3 acid" || row["column_name"]== "Serine" || row["column_name"]== "Arginine" || row["column_name"]== "Eicosatetraenoic acid" || row["column_name"]== "Lutein + zeaxanthin" || row["column_name"]== "Eicosenoic acid" || row["column_name"]== "Octadecatetraenoic acid" || row["column_name"].match(/.acid$/) || row["column_name"]== "Valine"|| row["column_name"]== "Alanine"|| row["column_name"]== "Proline" || row["column_name"]== "Saturated fatty acids"|| row["column_name"]== "Glycine"|| row["column_name"]== "Theobromine"|| row["column_name"]== "Retinol"|| row["column_name"]== "Copper, Cu"|| row["column_name"]== "Selenium, Se"|| row["column_name"]== "Calories"|| row["column_name"]== "Choline"|| row["column_name"]== " Mg"|| row["column_name"]== "Manganese, Mn" || row["column_name"]== "Histidine" || row["column_name"]== "Cryptoxanthin, beta"|| row["column_name"]== "Lycopene"|| row["column_name"]== "Methionine"|| row["column_name"]== "Leucine"|| row["column_name"]== "Phenylalanine"|| row["column_name"]== "Tyrosine"|| row["column_name"]== "Cystine"|| row["column_name"]== "Lysine"|| row["column_name"]== "Threonine"|| row["column_name"]== "Isoleucine"|| row["column_name"]== "Tryptophan"|| row["column_name"]== "Alcohol, ethyl"|| row["column_name"]== "Carotene, alpha"|| row["column_name"]== "Carotene, beta"|| row["column_name"]== "Ash"|| row["column_name"]== "Ash"|| row["column_name"]== "Folate, DFE"|| row["column_name"]== "Folate, food"|| row["column_name"]== "Tocopherol, alpha"|| row["column_name"]== "Betaine"
   elsif sql == sql + sql

    # row["column_name"]== "Folate" && row["column_name"]== "Folate" ||  row["column_name"]== "Water" && row["column_name"]== "Water" || row["column_name"]== "Energy" && row["column_name"]== "Energy" || row["column_name"]== "Protein" && row["column_name"]== "Protein" || row["column_name"]== "Total lipid (fat)" && row["column_name"]== "Total lipid (fat)" || row["column_name"]== "Carbohydrate, by difference" && row["column_name"]== "Carbohydrate, by difference" || row["column_name"]== "Fiber, total dietary" && row["column_name"]== "Fiber, total dietary" || row["column_name"]== "Sugars, total" && row["column_name"]== "Sugars, total" || row["column_name"]== "Minerals" && row["column_name"]== "Minerals" || row["column_name"]== "Calcium, Ca" && row["column_name"]== "Calcium, Ca" || row["column_name"]== "Iron, Fe" && row["column_name"]== "Iron, Fe"  || row["column_name"]== "Phosphorus, P'" && row["column_name"]== "Phosphorus, P'"|| row["column_name"].match(/Magnesium/) && row["column_name"].match(/Magnesium/)|| row["column_name"]== "Phosphorus, P" && row["column_name"]== "Phosphorus, P"|| row["column_name"]== "Potassium, K" && row["column_name"]== "Potassium, K"|| row["column_name"]== "Sodium, Na" && row["column_name"]== "Sodium, Na"|| row["column_name"]== "Zinc, Zn" && row["column_name"]== "Zinc, Zn" || row["column_name"]== "Thiamin" && row["column_name"]== "Thiamin"|| row["column_name"]== "Riboflavin" && row["column_name"]== "Riboflavin"|| row["column_name"]== "Niacin" && row["column_name"]== "Niacin" || row["column_name"]== "Vitamin B-6" && row["column_name"]=='Vitamin B-6' || row["column_name"]== "Vitamin B-12" && row["column_name"]=='Vitamin B-12' || row["column_name"]== "Vitamin A, IU" && row["column_name"]=='Vitamin A, IU' || row["column_name"]== "Vitamin D" && row["column_name"]=='Vitamin D' || row["column_name"]== "Vitamin K (phylloquinone)" && row["column_name"]=='Vitamin K (phylloquinone)'|| row["column_name"]== "Lipids" && row["column_name"]=='Vitamin D'|| row["column_name"]== "Vitamin D" && row["column_name"]=='Vitamin D'
    next
# elsif row["column_name"] && row["column_name"] == 'Water'
#   next
    #     elsif row["column_name"] == 'Water' && row["column_name"] == 'Water'
    # sql=sql+'water,'
    elsif row["column_name"] == 'Vitamin C, total ascorbic acid' || row["column_name"] == 'Vitamin C'
    sql=sql+'vitaminc,'

    elsif row["column_name"] == 'Total lipid (fat)' || row["column_name"] == 'Fat'|| row["column_name"]== "totallipidfat" && row["column_name"]== "totallipidfat"
      sql=sql+'totallipidfat,'

    elsif row["column_name"]=='Carbohydrate, by difference' || row["column_name"]=='Carbohydrate'
      sql=sql+'carbohydrate,'

    elsif row["column_name"]=='Fiber, total dietary' || row["column_name"]=='Fiber'
      sql=sql+'fiber,'

    elsif row["column_name"]=='Sugars, total' || row["column_name"]=='Sugars'
      sql=sql+'sugars,'

    elsif row["column_name"]=='Calcium, Ca' || row["column_name"]=='Calcium, Ca' && row["column_name"]=='Calcium, Ca'
      sql=sql+'calcium,'

    elsif row["column_name"]=='Iron, Fe'
      sql=sql+'iron,'

    elsif row["column_name"].match(/Magnesium/)
      sql=sql+'magnesium,'

    elsif row["column_name"]=='Phosphorus, P'
      sql=sql+'phosphorus,'

    elsif row["column_name"]=='Potassium, K'
      sql=sql+'potassium,'

    elsif row["column_name"]=='Sodium, Na'
      sql=sql+'sodium,'

    elsif row["column_name"]=='Zinc, Zn'
      sql=sql+'zinc,'

    elsif row["column_name"]=='Vitamin B-6' || row["column_name"]== 'Vitamin B6'
      sql=sql+'vitaminb6,'

    elsif row["column_name"]=='Folate, DFE' && row["column_name"]=='Folate'
      sql=sql+'folate,'

    elsif row["column_name"]=='Vitamin D'
      sql=sql+'vitamind,'

    elsif row["column_name"]=='Vitamin K (phylloquinone)' || row["column_name"]=='Vitamin K'
      sql=sql+'vitamink,'

    elsif row["column_name"]=='Vitamin B-12' || row["column_name"]=='Vitamin B12'
      sql=sql+'vitaminb12,'

    elsif row["column_name"]=='Vitamin A, IU'
      sql=sql+'vitamina_iu,'

    elsif row["column_name"]=='Vitamin E (alpha-tocopherol)' || row["column_name"]=='Vitamin E'
      sql=sql+'vitamine,'

    elsif row["column_name"]=='Fatty acids, total saturated' || row["column_name"]=='Saturated fatty acids'
      sql=sql+'saturatedFats,'

    elsif row["column_name"]=='Fatty acids, total monounsaturated' || row["column_name"]=='Monounsaturated fatty acids'
      sql=sql+'monounsaturated,'

    elsif row["column_name"]=='Fatty acids, total polyunsaturated' || row["column_name"]=='Polyunsaturated fatty acids'
      sql=sql+'polyunsaturated,'

    elsif row["column_name"]=='Fatty acids, total trans'
      sql=sql+'trans,'

    elsif row["column_name"]=='Amino Acids'
      sql=sql+'aminoacids,'
    # elsif user_file == user_file
    #  clean = cleaner_filename
    #   sql =sql + clean+","
    else
     sql = sql + row["column_name"]+","
    end
end
sql.slice!(sql.length-1, sql.length)
sql=sql+") values ("

# Get all the column values in the SQL statement.
good_to_go=false
columns_values.each_with_index do |row, index|
  if row["column_name"] == "Nutrient"
    good_to_go = true
    next
  end
  if index == ''
    index = '0'
    next
  end

   if row["column_name"] == 'Vitamin A, RAE' || row["column_name"] == 'Vitamin E (alpha-tocopherol)' || row["column_name"] == 'Vitamin D (D2 + D3)' || row["column_name"].match(/^\W/) || row["column_name"] == 'Other' || row["column_name"] == "Caffeine" || row["column_name"] == "Footnotes" || row["column_name"] == "Vitamins" || row["column_name"] == "Proximates" || row["column_name"] == "Source: USDA National Nutrient Database for Standard Reference 28 Software v.2.3.7.5" || row["column_name"].match(/:/) || row["column_name"].match(/Report/) || row["column_name"]== "Hexadecenoic acid" || row["column_name"]== "Eicosapentaenoic n-3 acid" || row["column_name"]== "Vitamin A" || row["column_name"]== "Octadecadienoic acid" || row["column_name"]== "Glutamic acid" || row["column_name"]== "Aspartic acid" || row["column_name"]== "Docosahexaenoic n-3 acid" || row["column_name"]== "Serine" || row["column_name"]== "Arginine" || row["column_name"]== "Eicosatetraenoic acid" || row["column_name"]== "Lutein + zeaxanthin" || row["column_name"]== "Eicosenoic acid" || row["column_name"]== "Octadecatetraenoic acid" || row["column_name"].match(/.acid$/) || row["column_name"]== "Valine"|| row["column_name"]== "Alanine"|| row["column_name"]== "Proline" || row["column_name"]== "Saturated fatty acids"|| row["column_name"]== "Glycine"|| row["column_name"]== "Theobromine"|| row["column_name"]== "Retinol"|| row["column_name"]== "Copper, Cu"|| row["column_name"]== "Selenium, Se"|| row["column_name"]== "Calories"|| row["column_name"]== "Choline"|| row["column_name"]== " Mg"|| row["column_name"]== "Manganese, Mn" || row["column_name"]== "Histidine" || row["column_name"]== "Cryptoxanthin, beta"|| row["column_name"]== "Lycopene"|| row["column_name"]== "Methionine"|| row["column_name"]== "Leucine"|| row["column_name"]== "Phenylalanine"|| row["column_name"]== "Tyrosine"|| row["column_name"]== "Cystine"|| row["column_name"]== "Lysine"|| row["column_name"]== "Threonine"|| row["column_name"]== "Isoleucine"|| row["column_name"]== "Tryptophan"|| row["column_name"]== "Alcohol, ethyl"|| row["column_name"]== "Carotene, alpha"|| row["column_name"]== "Carotene, beta"|| row["column_name"]== "Ash"|| row["column_name"]== "Ash"|| row["column_name"]== "Folate, DFE"|| row["column_name"]== "Folate, food"|| row["column_name"]== "Tocopherol, alpha"|| row["column_name"]== "Betaine"

    # row["column_name"]== "Folate" && row["column_name"]== "Folate" ||  row["column_name"]== "Water" && row["column_name"]== "Water" || row["column_name"]== "Energy" && row["column_name"]== "Energy" || row["column_name"]== "Protein" && row["column_name"]== "Protein" || row["column_name"]== "Total lipid (fat)" && row["column_name"]== "Total lipid (fat)" || row["column_name"]== "Carbohydrate, by difference" && row["column_name"]== "Carbohydrate, by difference" || row["column_name"]== "Fiber, total dietary" && row["column_name"]== "Fiber, total dietary" || row["column_name"]== "Sugars, total" && row["column_name"]== "Sugars, total" || row["column_name"]== "Minerals" && row["column_name"]== "Minerals" || row["column_name"]== "Calcium, Ca" && row["column_name"]== "Calcium, Ca" || row["column_name"]== "Iron, Fe" && row["column_name"]== "Iron, Fe"  || row["column_name"]== "Phosphorus, P'" && row["column_name"]== "Phosphorus, P'"|| row["column_name"].match(/Magnesium/) && row["column_name"].match(/Magnesium/)|| row["column_name"]== "Phosphorus, P" && row["column_name"]== "Phosphorus, P"|| row["column_name"]== "Potassium, K" && row["column_name"]== "Potassium, K"|| row["column_name"]== "Sodium, Na" && row["column_name"]== "Sodium, Na"|| row["column_name"]== "Zinc, Zn" && row["column_name"]== "Zinc, Zn" || row["column_name"]== "Thiamin" && row["column_name"]== "Thiamin"|| row["column_name"]== "Riboflavin" && row["column_name"]== "Riboflavin"|| row["column_name"]== "Niacin" && row["column_name"]== "Niacin" || row["column_name"]== "Vitamin B-6" && row["column_name"]=='Vitamin B-6' || row["column_name"]== "Vitamin B-12" && row["column_name"]=='Vitamin B-12' || row["column_name"]== "Vitamin A, IU" && row["column_name"]=='Vitamin A, IU' || row["column_name"]== "Vitamin D" && row["column_name"]=='Vitamin D' || row["column_name"]== "Vitamin K (phylloquinone)" && row["column_name"]=='Vitamin K (phylloquinone)'|| row["column_name"]== "Lipids" && row["column_name"]=='Vitamin D'|| row["column_name"]== "Vitamin D" && row["column_name"]=='Vitamin D'
  else
    sql = sql + row["column_value"].to_s+","
      end
end

 puts "im outside the loop"
sql.slice!(sql.length-1, sql.length)
sql=sql+")"
# sql.gsub!(',,', ',')
# sql.gsub!(',)', ')')
puts sql
puts times
conn = PG::Connection.open(:dbname => 'finalproj')
res = conn.query(sql)
times+=1
end
end



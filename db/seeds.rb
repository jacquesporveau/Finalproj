require 'pg'
require 'csv'
arr=[]
users_csvs = Dir['./db/foodCSV/**/*1.csv']
puts "starting"
times=0
users_csvs.each do |user_file|
cleaner_filename = user_file.gsub('1.csv', '').gsub(/.*\//, '')
# conn.prepare('statement1', 'insert into table1 (id, name, profile) values ($1, $2, $3)')
record={} #This will be created to record the column name and its corresponding value
columns_values = [] #This array will store hashes of column names and values
#The loop below will create an Array of Hashes and each Hash will store the column name and its
#corresponding value.

CSV.foreach(user_file, :encoding =>'windows-1251:utf-8') do |row|
  # dog = cleaner_filename.split(',').to_s
  # puts dog.class

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
    columns_values << record

end


sql = "insert into foods ("
good_to_go = false
# Get all the column names in the SQL statement
columns_values.each_with_index do |row, index|

    if row["column_name"] == "Nutrient"
      good_to_go = true
      next
    end
#       if user_file == cleaner_filename
#     sql=sql+'name,'
#     puts sql
# end

# if  user_file == user_file
#   cleaner_filename
#       sql =sql +"name,"
#     end

  if row["column_name"] == 'Vitamin A, RAE' || row["column_name"] == 'Vitamin E (alpha-tocopherol)' || row["column_name"] == 'Vitamin D (D2 + D3)' || row["column_name"].match(/^\W/) || row["column_name"] == 'Other' || row["column_name"] == "Caffeine" || row["column_name"] == "Footnotes" || row["column_name"] == "Vitamins" || row["column_name"] == "Proximates" || row["column_name"] == "Source: USDA National Nutrient Database for Standard Reference 28 Software v.2.3.7.5" || row["column_name"].match(/:/) || row["column_name"].match(/Report/) || row["column_name"]== "Hexadecenoic acid" || row["column_name"]== "Eicosapentaenoic n-3 acid" || row["column_name"]== "Vitamin A" || row["column_name"]== "Octadecadienoic acid" || row["column_name"]== "Glutamic acid" || row["column_name"]== "Aspartic acid" || row["column_name"]== "Docosahexaenoic n-3 acid" || row["column_name"]== "Serine" || row["column_name"]== "Arginine" || row["column_name"]== "Eicosatetraenoic acid" || row["column_name"]== "Lutein + zeaxanthin" || row["column_name"]== "Eicosenoic acid" || row["column_name"]== "Octadecatetraenoic acid" || row["column_name"].match(/.acid$/) || row["column_name"]== "Valine"|| row["column_name"]== "Alanine"|| row["Histidine"]== "Proline"|| row["column_name"]== "Saturated fatty acids"|| row["column_name"]== "Glycine"|| row["column_name"]== "Theobromine"|| row["column_name"]== "Retinol"|| row["column_name"]== "Copper, Cu"|| row["column_name"]== "Selenium, Se"|| row["column_name"]== "Calories"|| row["column_name"]== "Choline"|| row["column_name"]== "Retinol"|| row["column_name"]== "Retinol"
    next

    elsif row["column_name"] == 'Vitamin C, total ascorbic acid' || row["column_name"] == 'Vitamin C'
    sql=sql+'vitaminc,'

    elsif row["column_name"] == 'Total lipid (fat)'
      sql=sql+'totallipidfat,'

    elsif row["column_name"]=='Carbohydrate, by difference'
      sql=sql+'carbohydrate,'

    elsif row["column_name"]=='Fiber, total dietary'
      sql=sql+'fiber,'

    elsif row["column_name"]=='Sugars, total'
      sql=sql+'sugars,'

    elsif row["column_name"]=='Calcium, Ca'
      sql=sql+'calcium,'

    elsif row["column_name"]=='Iron, Fe'
      sql=sql+'iron,'

    elsif row["column_name"] =='Magnesium, Mg' ||row["column_name"]=='Manganese, Mn'
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

    elsif row["column_name"]=='Folate, DFE'
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

    elsif row["column_name"]=='Fatty acids, total saturated'
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

  if row["column_name"] == 'Vitamin A, RAE' || row["column_name"] == 'Vitamin E (alpha-tocopherol)' || row["column_name"] == 'Vitamin D (D2 + D3)' || row["column_name"].match(/^\W/) || row["column_name"] == 'Other' || row["column_name"] == "Caffeine" || row["column_name"] == "Footnotes" || row["column_name"] == "Vitamins" || row["column_name"] == "Proximates" || row["column_name"] == "Source: USDA National Nutrient Database for Standard Reference 28 Software v.2.3.7.5" || row["column_name"].match(/:/) || row["column_name"].match(/Report/) || row["column_name"]== "Hexadecenoic acid" || row["column_name"]== "Eicosapentaenoic n-3 acid" || row["column_name"]== "Vitamin A" || row["column_name"]== "Octadecadienoic acid" || row["column_name"]== "Glutamic acid" || row["column_name"]== "Aspartic acid" || row["column_name"]== "Docosahexaenoic n-3 acid" || row["column_name"]== "Serine" || row["column_name"]== "Arginine" || row["column_name"]== "Eicosatetraenoic acid" || row["column_name"]== "Lutein + zeaxanthin" || row["column_name"]== "Eicosenoic acid" || row["column_name"]== "Octadecatetraenoic acid" || row["column_name"].match(/.acid$/) || row["column_name"]== "Valine"|| row["column_name"]== "Alanine"|| row["Histidine"]== "Proline"|| row["column_name"]== "Saturated fatty acids"|| row["column_name"]== "Glycine"|| row["column_name"]== "Valine"|| row["column_name"]== "Valine" || row["column_name"].match(/.fatty/)


    next
  end
    sql = sql + row["column_value"].to_s+","
  end

 puts "im outside the loop"
sql.slice!(sql.length-1, sql.length)
sql=sql+")"
# sql.gsub!(',,', ',')
# sql.gsub!(',)', ')')
puts sql


conn = PG::Connection.open(:dbname => 'finalproj')
res = conn.query(sql)
end




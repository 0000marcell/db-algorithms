require 'table_print'
require 'faker'

# create a table with random values and a predominant 
# value for country
countries = ['CN', 'CN', 'CN', 'USA', 'GER']
rows = []
10.times do
  obj = {"name" => Faker::Name.name, 
         "address" => Faker::Address.secondary_address,
         "country" => countries[rand(0..4)]
         }
  rows.push(obj)
end
# sort the rows by country population, 
# because we dont have this agregates in this case is china
s_row = []
r_row = []
rows.each_with_index do |v, i|
  if v["country"] == "CN"
    s_row.push(rows[i])
  else
    r_row.push(rows[i])
  end
end
rows = s_row + r_row
puts "sorted generated row"
tp rows, ["name", "address", "country"]
# divided the table in columns 
def column_layout(rows)
  column_obj = {}
  rows.each do |row|
    row.each do |k, v|
      if !column_obj[k]
        column_obj[k] = []
      end
      column_obj[k].push(v)
    end
  end
  column_obj
end

# create dic and av
def create_dic(column)
  column.uniq
end

# create av
def create_av(column, dic)
  av = []
  dic_map = {}
  column.each_with_index do |val, i|
    if !dic_map[val]
      dic.each_with_index do |dic, i|
        if val == dic 
          dic_map[dic] = i
        end
      end
    end
    av.push(dic_map[val]) 
  end
  av
end

# assuming the av is already sorted by the 
# value with most occurences 
def prefix_encode(column)
  result = []
  encoded_val = false
  oc_count = 0
  column["av"].each_with_index do |v, i|
    if i == 0
      result.push(v)
      oc_count = oc_count + 1
    elsif v == 0
      oc_count = oc_count + 1
    else
      result.push(v)
    end
  end
  column["av"] = result
  column["oc_count"] = oc_count
end

# divide the table in columns
columns = column_layout(rows)

# create obj for tables
db = {}
columns.each do |k, v|
  db[k] = {"dic" => [], "av" => []}
end

# create dic and av
db["country"]["dic"] = create_dic(columns["country"])
db["country"]["av"] = create_av(columns["country"],
                               db["country"]["dic"])
prefix_encode(db["country"])
puts "final result prefix encoded!"
puts "av *****"
puts db["country"]["av"]
puts "*******"
puts "number of occurences"
puts db["country"]["oc_count"]

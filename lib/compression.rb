require 'table_print'
require 'faker'

def generate_data()
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
  rows
end


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

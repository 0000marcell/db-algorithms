require 'table_print'
require 'faker'

def sort_list(list, k)
  return list if list.size <= 1
  swapped = true
  while swapped do
    swapped = false
    0.upto(list.size-2) do |i|
      if list[i][k] > list[i+1][k]
        list[i][k], list[i+1][k] = list[i+1][k], list[i][k]
        swapped = true
      end
    end    
  end
  list
end

def generate_data()
  # create a table with random values and a predominant 
  # value for country
  countries = ['CN', 'CN', 'CN', 'USA', 'GER']
  gender = ["M", "F"]
  rows = []
  10.times do
    obj = {"name" => Faker::Name.name, 
           "address" => Faker::Address.secondary_address,
           "country" => countries[rand(0..4)],
           "gender" => gender[rand(0..1)]
           }
    rows.push(obj)
  end
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

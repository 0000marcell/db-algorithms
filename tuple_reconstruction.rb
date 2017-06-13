require_relative './lib/utils'
require_relative './lib/run_length_encoding'

def tuple_reconstruction(db, sorted_k)
  rows = []
  last_item = -1
  db[sorted_k]["av"].each do |v|
    first_item = last_item + 1 
    last_item = 
      db[sorted_k]["oc_count"][v] - 1 + first_item
    sorted_val = db[sorted_k]["dic"][v]
    (first_item..last_item).each do |n|
      obj = {}
      db.each do |k, v|
        if k == sorted_k
          obj[k] = sorted_val
        else
          dic_id = db[k]["av"][n]
          obj[k] = db[k]["dic"][dic_id]
        end
      end
      rows.push(obj)
    end
  end 
  rows
end



# tuple reconstruction with 1 table
rows = generate_data()
rows = sort_list(rows, "country")
tp rows, ["name", "address", "country"]
columns = column_layout(rows)

db = {}
columns.each do |k, v|
  db[k] = {}
  db[k]["dic"] = create_dic(columns[k])
  db[k]["av"] = create_av(columns[k],
                          db[k]["dic"])
end

puts "db before"
puts db

run_length_encoding(db["country"])

puts "db before run length"
puts db

rows = tuple_reconstruction(db, "country")

puts "result"
tp rows, ["name", "address", "country"]

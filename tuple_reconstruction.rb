require_relative './lib/utils'
require_relative './lib/run_length_encoding'
require_relative './lib/tuple_reconstruction'

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

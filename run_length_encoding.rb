require_relative './lib/utils'
require_relative './lib/run_length_encoding'

rows = generate_data()
rows = sort_list(rows, "country")
tp rows, ["name", "address", "country"]
columns = column_layout(rows)

db = {}
columns.each do |k, v|
  db[k] = {"dic" => [], "av" => []}
end

# create dic and av
db["country"]["dic"] = create_dic(columns["country"])
db["country"]["av"] = create_av(columns["country"],
                               db["country"]["dic"])

run_length_encoding(db["country"])
puts "final result prefix encoded!"
puts "av *****"
puts db["country"]["av"]
puts "*******"
puts "number of occurences"
puts db["country"]["oc_count"]

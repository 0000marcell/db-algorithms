require_relative './lib/utils'
require_relative './lib/run_length_encoding'

rows = generate_data()
quick_sort(rows, "country")
tp rows, ["name", "address", "country"]
db = create_db(rows)
run_length_encoding(db["country"])
puts "final result prefix encoded!"
puts "av *****"
puts db["country"]["av"]
puts "*******"
puts "number of occurences"
puts db["country"]["oc_count"]

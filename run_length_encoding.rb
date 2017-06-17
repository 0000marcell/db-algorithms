require_relative './lib/utils'
require_relative './lib/run_length_encoding'
require 'benchmark'

rows = generate_data(5000)
quick_sort(rows, "country")
#tp rows, ["name", "address", "country"]
db = create_db(rows)
Benchmark.bm do |bm|
  bm.report("run length") do
    run_length_encoding(db["country"])
  end
end
puts "final result prefix encoded!"
puts "av *****"
puts db["country"]["av"]
puts "*******"
puts "number of occurences"
puts db["country"]["oc_count"]

require 'benchmark'
require_relative './lib/utils'

# return the valueID of all the matches in the format
# {k => [1, 2, 3]}
def create_hash(db, k, val)
  hash_map = {}
  hash_map[k] = []
  res = bin_search(db[k]["dic"], val)
  db[k]["av"].each_with_index do |v, i|
    if v == res then hash_map[k].push(i) end
  end
  hash_map
end

def hash_join(db, term1, term2)
  h1 = create_hash(db, term1["k"], term1["val"])
  h2 = create_hash(db, term2["k"], term2["val"])
  puts "h1 #{h1}"
  puts "h2 #{h2}"
  (h1[term1["k"]] & h2[term2["k"]])
end

Benchmark.bm do |bm|
  rows = []
  db = false
  bm.report("generate") do
    rows = generate_data(10)
    quick_sort(rows, "country")
    tp rows, ["name", "country", "gender"]
  end

  bm.report("create db") do
    db = create_db(rows)
  end
  
  bm.report("hash join") do
    puts "get all german males"
    puts hash_join(db, 
      {"k" => "country", "val" => "GER"},
      {"k" => "gender", "val" => "M"})
  end
end

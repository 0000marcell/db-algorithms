require_relative './lib/utils'
require 'benchmark'

# list the number of males in germany
# this can be made faster
def early_materialization(db)
  aggregate = 0
  db["gender"]["dic"].each_with_index do |v, i|
    if v == "M" 
      c_pos = i 
      db["gender"]["av"].each_with_index do |v, i|
        if v == c_pos 
          av_pos = db["country"]["av"][i]
          dic_value = db["country"]["dic"][av_pos]
          if dic_value == "GER"
            aggregate = aggregate + 1
          end
        end
      end
      break
    end
  end
  aggregate 
end

rows = generate_data(5000)
quick_sort(rows, "country")
#tp rows, ["name", "address", "country", "gender"]
db = create_db(rows)
puts "number of male germans "
Benchmark.bm do |bm|
  bm.report("early materialization") do
    puts early_materialization(db)
  end
end

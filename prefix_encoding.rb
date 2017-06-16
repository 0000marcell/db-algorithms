require_relative './lib/utils'

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

rows = generate_data()
bubble_sort(rows, "country")
tp rows, ["name", "address", "country"]
db = create_db(rows)
prefix_encode(db["country"])
puts "final result prefix encoded!"
puts "av *****"
puts db["country"]["av"]
puts "*******"
puts "number of occurences"
puts db["country"]["oc_count"]

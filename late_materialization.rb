require_relative './lib/utils'

# list the number of males in germany
def late_materialization(db)
  part_result_1 = []
  part_result_2 = []
  db["country"]["dic"].each_with_index do |v, i|
    if v == "GER" 
      db["country"]["av"].each.with_index do |val, ind|
        if val == i then part_result_1.push(ind) end
      end
      break
    end
  end
  db["gender"]["dic"].each_with_index do |v, i|
    if v == "M" 
      db["gender"]["av"].each.with_index do |val, ind|
        if val == i then part_result_2.push(ind) end
      end
      break
    end
  end 
  # with this returned array we can materialize the
  # row the length of the array is the aggregation
  # in this case the materialiation is not neccessarry
  (part_result_1 & part_result_2)
end

rows = generate_data()
rows = bubble_sort(rows, "country")
tp rows, ["name", "address", "country", "gender"]
columns = column_layout(rows)

db = {}
columns.each do |k, v|
  db[k] = {}
  db[k]["dic"] = create_dic(columns[k])
  db[k]["av"] = create_av(columns[k],
                          db[k]["dic"])
end

puts "number of german males"
puts late_materialization(db).length

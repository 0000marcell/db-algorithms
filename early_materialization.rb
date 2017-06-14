require_relative './lib/utils'

# list the number of males in germany
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

rows = generate_data()
rows = sort_list(rows, "country")
tp rows, ["name", "address", "country", "gender"]
columns = column_layout(rows)

db = {}
columns.each do |k, v|
  db[k] = {}
  db[k]["dic"] = create_dic(columns[k])
  db[k]["av"] = create_av(columns[k],
                          db[k]["dic"])
end

puts "number of male germans "
puts early_materialization(db)

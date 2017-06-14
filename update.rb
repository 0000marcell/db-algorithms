require_relative './lib/utils'
require_relative './lib/tuple_reconstruction'

def update(db, id, k, val)
  is_in_dic = false
  pos = false
  db[k]["dic"].each_with_index do |v, i|
    if v == val then 
      is_in_dic = true 
      pos = i
      break
    end
  end
  if is_in_dic
    db[k]["av"][id] = pos
  else
    db[k]["dic"].push(val)
    db[k]["dic"].sort!
    n_pos = false
    db[k]["dic"].each_with_index do |v, i|
      if n_pos
        db[k]["av"].each_with_index do |v, ind|
          if v >= n_pos and id != ind
            db[k]["av"][ind] = v + 1
          end
        end
        break
      else
        if v == val
          n_pos = i
          db[k]["av"][id] = n_pos
        end
      end
    end
  end
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


puts "update a value that is already in the dic"
update(db, 0, "country", "GER")

new_rows = tuple_reconstruction_umcomp(db, "country")
tp new_rows, ["name", "address", "country"]

puts "update a value  that is not in the dic"
update(db, 0, "country", "BRA")

new_rows = tuple_reconstruction_umcomp(db, "country")
tp new_rows, ["name", "address", "country"]

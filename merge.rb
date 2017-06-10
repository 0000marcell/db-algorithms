require 'table_print'

main = {
  "dic" =>  {
    "fname" =>  ["Albert", "Michael", "Nadja"],
    "city" =>  ["Berlin", "London"]
  },
  "av" =>  {
    "fname" => [2, 1, 0],
    "city" => [0, 1, 0]
  },
  "val_vec" => [1, 1, 1]
}

dif_buf = {
  "dic" => {
    "fname" => [],
    "city" =>  [] 
  },
  "av" =>  {
    "fname" => [],
    "city" =>  []
  },
  "val_vec" => []
}

# finds the pos of the element on a given array
def find_pos(val, arr)
  result = false
  arr.each_with_index do |item, index|
    if item == val
      result = index
      break
    end
  end
  result
end

# insert val
def save_val(fname, city, dif_buf, main)
  # insert in the dif bug
  fname_pos = find_pos(fname, dif_buf["dic"]["fname"])
  if(fname_pos == false)
    dif_buf["dic"]["fname"] << fname
    fname_pos = dif_buf["dic"]["fname"].length - 1
  end
  city_pos = find_pos(city, dif_buf["dic"]["city"])
  if(city_pos == false)
    dif_buf["dic"]["city"] << city 
    city_pos = dif_buf["dic"]["city"].length - 1
  end
  dif_buf["av"]["fname"] << fname_pos 
  dif_buf["av"]["city"] << city_pos 
  dif_buf["val_vec"] << 1 
  
  # invalidate in the main, name is the main index
  fname_pos = find_pos(fname, main["dic"]["fname"])
  if fname_pos
    main["val_vec"][fname_pos] = 0
  end

  # invalidate in the dif_buf, 
end

def print_tables(dif_buf, main)
  main_rows = [] 
  dif_rows = []
  5.times do |i|
    main_rows << {"fname" => main["dic"]["fname"][i], 
         "city" => main["dic"]["city"][i],
         "attr_fname" => main["av"]["fname"][i],
         "attr_city" => main["av"]["city"][i], 
         "val_vec" => main["val_vec"][i]}
    dif_rows << {"fname" => dif_buf["dic"]["fname"][i], 
         "city" => dif_buf["dic"]["city"][i],
         "attr_fname" => dif_buf["av"]["fname"][i],
         "attr_city" => dif_buf["av"]["city"][i], 
         "val_vec" => dif_buf["val_vec"][i]}
  end
  puts "MAIN"
  puts "====================================="
  tp main_rows, "fname", "city", "attr_fname", 
    "attr_city", "val_vec"
  puts "DIFERENCIAL BUFFER"
  puts "====================================="
  tp dif_rows, "fname", "city", "attr_fname", 
    "attr_city", "val_vec"
end

puts "BEFORE INSERTS"
print_tables(dif_buf, main)
# michael moves to berlin
save_val("Michael", "Berlin", dif_buf, main)
# nadja moves to potsdam
save_val("Nadja", "Potsdam", dif_buf, main)
# michael moves to potsdam
save_val("Michael", "Potsdam", dif_buf, main)
# hanna is inserted 
save_val("Hanna", "Dresden", dif_buf, main)

puts "AFTER INSERTS"
print_tables(dif_buf, main)


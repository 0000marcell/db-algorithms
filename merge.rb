require 'table_print'
require 'byebug'
require_relative './print'

main = {
  "dic" =>  {
    "fname" =>  ["Albert", "Michael", "Nadja"],
    "city" =>  ["Berlin", "London"]
  },
  "av" =>  {
    "fname" => [2, 1, 0],
    "city" => [0, 1, 0]
  },
  "val_vec" => {
    "valid" => [1, 1, 1]
  }
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
  "val_vec" => {
    "valid" => []
  }
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
def insert(obj, dif_buf, main, pk)
  obj.each do |k, v|
    dic_pos = find_pos(v, dif_buf["dic"][k])
    if(dic_pos == false)
      dif_buf["dic"][k] << v
      dic_pos = dif_buf["dic"][k].length - 1
    else
      if(k == pk)
        av_pos = find_pos(dic_pos, dif_buf["av"][k])
        dif_buf["val_vec"]["valid"][av_pos] = 0
      end
    end

    if k == pk
      dif_buf["val_vec"]["valid"] << 1
      main_dic_pos = find_pos(v, main["dic"][k])
      main_av_pos = find_pos(main_dic_pos, main["av"][k])
      if main_av_pos
        main["val_vec"]["valid"][main_av_pos] = 0
      end
    end
    dif_buf["av"][k] << dic_pos 
  end
end

def move_to_history(obj)
  vv = obj["val_vec"]["valid"]
    .reject.with_index do |item, index|
    if item == 0
      obj["av"].each do |k, v|
        obj["av"][k].delete_at(index)
      end
      true
    else
      false
    end
  end 
  obj["val_vec"]["valid"] = vv
end

def create_map(old, merged)
  result = {}
  old.each do |k, v|
    result[k] = []
    old[k].each_with_index do |value, index|
      pos = find_pos(value, merged[k])
      result[k].push(pos)
    end
  end
  result
end

def translate(old, mapping)
  translated_obj = {}
  old.each do |k, v|
    translated_obj[k] = []
    old[k].each do |value|
      translated_obj[k].push(mapping[k][value])
    end
  end
  translated_obj
end


def dic_merge(main, dif_buf)
  merged_obj = {"dic" => {}}
  main["dic"].each do |k, v|
    merged_obj["dic"][k] = 
      (main["dic"][k]|dif_buf["dic"][k]).sort
  end 
  merged_obj["main_map"] = create_map(main["dic"], merged_obj["dic"])
  merged_obj["dif_map"] = create_map(dif_buf["dic"], merged_obj["dic"])
  translated_obj = {
    "main" => translate(main["av"], merged_obj["main_map"]), 
    "dif_buf" => translate(dif_buf["av"], merged_obj["dif_map"])
  }
  merged_av = {}
  translated_obj["main"].each do |k, v|
    merged_av[k] = 
      translated_obj["main"][k] + translated_obj["dif_buf"][k]
    dif_buf["dic"][k] = [] 
    dif_buf["av"][k] = []
  end
  dif_buf["val_vec"]['valid'] = []
  main["dic"] = merged_obj["dic"]
  main["av"] = merged_av
  main["val_vec"]["valid"] = 
    main["val_vec"]["valid"] + dif_buf["val_vec"]["valid"] 
end

def print(vec, val)
  puts "**************"
  puts "#{val} dic"
  print_table(vec["dic"], ["fname", "city"])
  puts "*************"
  puts "#{val} av"
  print_table(vec["av"], ["fname", "city"])
  puts "**************"
  puts "#{val} vv"
  print_table(vec["val_vec"], ["valid"])
  puts "**************"
end

puts "michael moves to berlin"
insert({"fname" => "Michael", "city" => "Berlin"}, 
         dif_buf, main, "fname")
puts "nadja moves to potsdam"
insert({"fname" => "Nadja", "city" => "Potsdam"}, 
         dif_buf, main, "fname")
puts "michael moves to potsdam"
insert({"fname" => "Michael", "city" => "Potsdam"}, 
         dif_buf, main, "fname")
puts "hanna inserted"
# hanna is inserted 
insert({"fname" => "Hanna", "city" => "Dresden"}, 
         dif_buf, main, "fname")
puts "dif buf after inserts"
print(dif_buf, "dif")
puts "main after inserts"
print(main, "main")
dic_merge(main, dif_buf)
puts "main after merge"
print(main, "main")
puts "dif buf after merge"
print(dif_buf, "dif")
=begin
puts "move to history"
move_to_history(dif_buf)
puts "main before move to history"
print(main, "main")
move_to_history(main)
puts "dif buf after move to history"
print(dif_buf, "DIF")
puts "main after move to history"
print(main, "main")
=end

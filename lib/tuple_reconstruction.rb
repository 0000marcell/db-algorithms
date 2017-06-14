def tuple_reconstruction(db, sorted_k)
  rows = []
  last_item = -1
  db[sorted_k]["av"].each do |v|
    first_item = last_item + 1 
    last_item = 
      db[sorted_k]["oc_count"][v] - 1 + first_item
    sorted_val = db[sorted_k]["dic"][v]
    (first_item..last_item).each do |n|
      obj = {}
      db.each do |k, v|
        if k == sorted_k
          obj[k] = sorted_val
        else
          dic_id = db[k]["av"][n]
          obj[k] = db[k]["dic"][dic_id]
        end
      end
      rows.push(obj)
    end
  end 
  rows
end

def tuple_reconstruction_umcomp(db, sorted_k)
  rows = []
  db[sorted_k]["av"].length.times do |i|
    obj = {}
    db.each do |k, v|
      av = db[k]["av"][i]
      obj[k] = db[k]["dic"][av]
    end
    rows.push(obj)
  end
  rows
end

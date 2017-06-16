require 'table_print'
require 'faker'
require 'byebug'

def create_db(rows)
  columns = column_layout(rows)
  db = {}
  columns.each do |k, v|
    db[k] = {}
    db[k]["dic"] = create_dic(columns[k])
    db[k]["av"] = create_av(columns[k],
                            db[k]["dic"])
  end
  db
end

def quick_sort(array, k, from=0, to=nil)
  if to == nil
    # Sort the whole array, by default
    to = array.count - 1
  end

  if from >= to
    # Done sorting
    return
  end

  # Take a pivot value
  pivot = array[from]

  # Min and Max pointers
  min = from
  max = to

  # Current free slot
  free = min

  while min < max
    if free == min # Evaluate array[max]
      if array[max][k] <= pivot[k] 
        array[free] = array[max]
        min += 1
        free = max
      else
        max -= 1
      end
    elsif free == max # Evaluate array[min]
      if array[min][k] >= pivot[k] # Bigger than pivot, must move
        array[free] = array[min]
        max -= 1
        free = min
      else
        min += 1
      end
    else
      raise "Inconsistent state"
    end
  end

  array[free] = pivot

  quick_sort array, k, from, free - 1
  quick_sort array, k, free + 1, to
end

# bubble sort
def bubble_sort(obj, k)
  return obj if obj.size <= 1
  swapped = true
  while swapped do
    swapped = false
    0.upto(obj.size-2) do |i|
      if obj[i][k] > obj[i+1][k]
        obj[i][k], obj[i+1][k] = obj[i+1][k], obj[i][k]
        swapped = true
      end
    end    
  end
end

def generate_data(nItems = 10)
  # create a table with random values and a predominant 
  # value for country
  countries = ['CN', 'CN', 'CN', 'USA', 'GER']
  gender = ["M", "F"]
  rows = []
  nItems.times do
    obj = {"name" => Faker::Name.name, 
           "address" => Faker::Address.secondary_address,
           "country" => countries[rand(0..4)],
           "gender" => gender[rand(0..1)]
           }
    rows.push(obj)
  end
  rows
end


# divided the table in columns 
def column_layout(rows)
  column_obj = {}
  rows.each do |row|
    row.each do |k, v|
      if !column_obj[k]
        column_obj[k] = []
      end
      column_obj[k].push(v)
    end
  end
  column_obj
end

# create dic and av
def create_dic(column)
  column.uniq.sort
end

# returns the item pos
def bin_search(array, val, from=0, to=nil)
  if !to then to = array.count - 1 end
  if from >= to then return "not found" end
  mid = (from + to)/2
  if val < array[mid] 
    return bin_search array, val, from, mid - 1
  elsif val > array[mid]
    return bin_search array, val, mid + 1, to
  else
    return mid
  end
end

# create av
def create_av(column, dic)
  av = []
  dic_map = {}
  column.each_with_index do |val, i|
    res = 
      bin_search(dic, val)
    av.push(res) 
  end
  av
end

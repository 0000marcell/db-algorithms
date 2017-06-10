require 'table_print'
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
  "val_vec" => [1, 1, 1]
}
arr = [0, 0, 1]
arr.each_with_index do |item, index|
  if item == 0
    arr.delete_at(index - 1)
  end
  puts item
end
puts "result #{arr}"

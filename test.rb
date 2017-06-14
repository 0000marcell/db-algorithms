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

arr1 = [1, 2, 3, 4, 5]
arr2 = [2, 3]
puts arr1 & arr2

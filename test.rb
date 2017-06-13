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
first = 0
last = 10
(first..last).each do |n|
  puts n
end

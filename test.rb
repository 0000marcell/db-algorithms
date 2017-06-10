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


puts trans_to_row(main["dic"])
#tp main["dic"], "fname", "city"

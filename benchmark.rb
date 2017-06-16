require 'benchmark'
require_relative './lib/utils'

Benchmark.bm do |bm|
  # joining an array of strings
  bm.report do
    puts "### quick sort"
    rows = generate_data(10000)
    quick_sort(rows, "country")
  end

  bm.report do
    puts "### bubble sort"
    rows = generate_data(10000)
    bubble_sort(rows, "country")
  end
end

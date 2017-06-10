require 'table_print'

def print_table(table, keys)
  rows  = []
  table.each do |k, v|
    v.each_with_index do |item, index|
      if rows[index]
        rows[index].merge!({k => item})
      else
        rows << {k => item}
      end
    end
  end
  tp rows, keys
end

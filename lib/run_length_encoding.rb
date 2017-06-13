def run_length_encoding(column)
  prev_val, oc_count, result = 
    false, 0, []
  column["oc_count"] = []
  column["av"].each do |v|
    if prev_val
      if prev_val == v 
        oc_count = oc_count + 1
      else
        column["oc_count"].push(oc_count)
        result.push(v)
        prev_val = v
        oc_count = 1
      end
    else
      oc_count = oc_count + 1
      result.push(v)
      prev_val = v
    end
  end
  column["oc_count"].push(oc_count)
  column["av"] = result
end

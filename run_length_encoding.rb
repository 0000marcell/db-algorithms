require_relative './lib/compression'

def run_length_encoding()
end

rows = generate_data()

columns = column_layout(rows)

db = {}
columns.each do |k, v|
  db[k] = {"dic" => [], "av" => []}
end

# create dic and av
db["country"]["dic"] = create_dic(columns["country"])
db["country"]["av"] = create_av(columns["country"],
                               db["country"]["dic"])



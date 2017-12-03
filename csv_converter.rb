require 'csv'
require 'pp'
require 'json'
HEADERS          = {name: 0, email: 1, address: 2, type: 3}
SERVICE_PROVIDER = ["Quintype", "Google", "Twitter", "Facebook", "Yahoo"]

def generate_user_record(length = 50)
  headers = ["name", "email", "address", "type"]
  [headers] + 1.upto(length).to_a.map {|record| ["sample-#{record}", "#{record}@gmail.com", "address-#{record}", SERVICE_PROVIDER.sample]}
end

def header_mapping(column)
  HEADERS[column.to_sym]
end

def generate_file(filename, data)
  File.open(filename, "w") { |f| f.write(data.map{|d| d.join(",")}.join("\n"))}
  p "File created"
  filename
end

def read_file(filename)
  @data = CSV.parse(File.read(filename))
end

def group_by_service_provider
  @data.group_by {|row| row[header_mapping("type")] }
end

def generate_hash
  @data.map {|row| Hash[HEADERS.keys.map(&:to_s).zip row] }
end

def run
  file_path = generate_file("first_file.csv", generate_user_record)

  read_file(file_path)
  @data.shift
  pp "GROUP BY SERVICE PROVIDERS"
  pp group_by_service_provider

  pp "GENERATE HASH"
  pp generate_hash.to_json
end


run

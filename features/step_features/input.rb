Given /^the input "([^"]*)"$/ do |input|
  @input = input
end

When /^the address is parsed we should get$/ do |table|
  actual = []
  table.hashes.each_with_index do |row,i|
    actual << row.dup.merge(parse(row['input']))
  end  
  table.custom_diff! actual
end

def parse input
  parts =  input.split(',')
  
  parsed = {}
  parsed['street'] = parts[0].to_s
  parsed['nr'] = parts[1].to_s
  parsed['city'] = nil.to_s
  parsed['zip'] = nil.to_s
  
  parsed
end
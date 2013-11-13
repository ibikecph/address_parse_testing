Given /^the input "([^"]*)"$/ do |input|
  @input = input
end

When /^the address is parsed we should get$/ do |table|
  actual = []
  table.hashes.each_with_index do |row,i|
    actual << row.dup.merge( parse(row['input']) )
  end  
  table.custom_diff! actual
end

def parse input
  parsed = {}
  
  # address
  # address is the first part that starts with a letter - expect if it's after zip
  if input.match /^[\s,]*\d{4}/       # if string starts with a zip, there's no street 
    parsed['street'] = ''    
  elsif input.match /^[\s,]*([^\d,]+)/    
    parsed['street'] = $1.to_s.strip
  elsif input.match /[\s,]*\d{1,3}[a-zA-Z]?[\s,]([^\d,]+)/
    parsed['street'] = $1.to_s.strip
  else
    parsed['street'] = ''
  end

  # nr
  # nr is always 1-3 digits, optionally follow by a letter
  # but take care not to grab part of a zip
  if input.match /[\s,](\d{1,3}[a-zA-Z]?)[\s,]/
    parsed['nr'] = $1.to_s.strip
  elsif input.match /[\s,](\d{1,3}[a-zA-Z]?)$/
    parsed['nr'] = $1.to_s.strip
  elsif input.match /^(\d{1,3}[a-zA-Z]?)[\s,]+/
    parsed['nr'] = $1.to_s.strip
  else
    parsed['nr'] = ''
  end
  
  # zip
  # zips are always four digits
  if input.match /(\d{4})/
    parsed['zip'] = $1.to_s.strip
  else
    parsed['zip'] = ''
  end
  
  # city
  # city is the first words after a comma or a nr
  if input.match /\d\w?\s+(([\p{L}]\s*)+)/
    parsed['city'] = $1.to_s.strip
  elsif input.match /,\s*(([\p{L}]\s*)+)/
    parsed['city'] = $1.to_s.strip
  else
    parsed['city'] = ''
  end

  parsed
end
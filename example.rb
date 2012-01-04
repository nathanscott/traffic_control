require "./lib/airport.rb"

airport = Airport.new "airport.local", "public"

puts "\n\nThere are around #{airport.settings["wirelessNumber"]} folk#{"s" unless airport.settings["wirelessNumber"] == 1} on your wifi"

puts "\n\n"

puts "Airport Info:"
airport.settings.each do |type, setting|
  puts "|   #{type}   |   #{setting}    |"
end

puts "\n\n"

print "Clients:"
airport.clients.each do |client, attributes|
  puts "Details for #{client}"
  attributes.each do |name, details|
    puts "|   #{name}   |   #{details}    |"
  end
  puts "\n\n"
end
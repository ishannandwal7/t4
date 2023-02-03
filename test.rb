data = "Day 1: Arrive in Jaipur and visit Amber Fort, City Palace and Jantar Mantar.

Day 2: Explore Jaipur further, including Hawa Mahal, Jal Mahal and Birla Temple.

Day 3: Drive to Jodhpur and visit Mehrangarh Fort and Jaswant Thada Memorial.

Day 4: Drive to Udaipur and visit the City Palace and Jagdish Temple.

Day 5: Take a boat ride on Lake Pichola and visit Jagmandir Island Palace.

Day 6: Drive to Jaisalmer and explore the Golden Fort, Patwon Ki Haveli and Gadisar Lake.

Day 7: Drive back to Jaipur for your departure flight."

def create_itinerary(input_string)
  cities = {
    "Delhi" => ["Red Fort", "India Gate", "Lotus Temple"],
    "Mumbai" => ["Gateway of India", "Marine Drive", "Elephanta Caves"],
    'Jaipur'=>['Amber Fort','City Palace','Jantar Mantar','Hawa Mahal','Jal Mahal','Birla Temple'],
    'Jodhpur'=>['Mehrangarh Fort','Jaswant Thada Memorial'],
    'Udaipur'=>['City Palace','Jagdish Temple'],
    'Jaisalmer'=>['Golden Fort','Patwon Ki Haveli','Gadisar Lake']
  }
  words = input_string.split(" ")
  
  found_cities = []
  words.each do |word|
    cities.keys.each do |city|
      if word == city
        found_cities << city
      end
    end
  end
  
  found_attractions = []
  found_cities.each do |city|
    cities[city].each do |attraction|
      if input_string.include?(attraction)
        found_attractions << attraction
      end
    end
  end
  
  itinerary = {}
  found_attractions.each do |attraction|
    found_cities.each do |city|
      if cities[city].include?(attraction)
        itinerary[attraction] = city
        break
      end
    end
  end
  
  return itinerary
end

def print_itinerary(itinerary)
  puts "Itinerary:"
  itinerary.each do |attraction, city|
    puts "- #{attraction} in #{city}"
  end
end

arr=create_itinerary(data);
print_itinerary(arr);


# # Split the data into separate lines
# days = data.split("\n")

# # Loop through each day
# days.each do |day|
#   # Split the day into separate parts
#   parts = day.split(":")
#   # Get the day number
#   day_number = parts[0].strip
#   # Get the location and attractions
#   location_and_attractions = parts[1].strip
  
#   # Split the location and attractions into separate parts
#   location_and_attractions_parts = location_and_attractions.split(" and ")
  
#   # Get the location
#   location = location_and_attractions_parts[0].gsub("Drive to ", "").strip
  
#   # Get the attractions
#   attractions = location_and_attractions_parts[1..-1].join(" and ").strip
  
#   puts "Day #{day_number}"
#   puts "Location: #{location}"
  
#   # Split the attractions into separate activities
#   activities = attractions.split(",").map(&:strip)
  
#   # Loop through each activity
#   activities.each do |activity|
#     puts "Activity: #{activity}"
#   end
#   puts "-----------------"
# end

# data = "Day 1: Arrive in Jaipur and visit Amber Fort, City Palace and Jantar Mantar.

# Day 2: Explore Jaipur further, including Hawa Mahal, Jal Mahal and Birla Temple.

# Day 3: Drive to Jodhpur and visit Mehrangarh Fort and Jaswant Thada Memorial.

# Day 4: Drive to Udaipur and visit the City Palace and Jagdish Temple.

# Day 5: Take a boating on Lake Pichola and visit Jagmandir Island Palace.

# Day 6: Drive to Jaisalmer and explore the Golden Fort, Patwon Ki Haveli and Gadisar Lake.

# Day 7: Drive back to Jaipur for your departure flight."
data="Day 1:
- Arrive in Indore
- Check in to your hotel
- Explore Sarafa Bazaar for street food
- Visit the Rajwada Palace

Day 2:
- Visit the famous Annapurna Temple for breakfast
- Visit the Lal Bagh Palace and Central Museum
- Visit the Khajrana Ganesh Temple
- Explore the food street of Sarafa Bazaar

Day 3:
- Visit the Patalpani Waterfall
- Visit the Tincha Falls and Trek to Tincha
- Visit the Pisanhari Ki Madhi
- Visit the Chhappan Dukaan for street food

Day 4:
- Visit the Shri Omkareshwar Jyotirlinga Temple
- Visit the Mandu Fort and Jahaz Mahal
- Visit the Hindola Mahal and Jahaz Mahal

Day 5:
- Visit the Tshai waterfall and trek to Tshai
- Visit the Ujjain city and Ujjain Mahakal Temple
- Visit the Gomatgiri Jain Temple

Day 6:
- Visit the Ram Krishna Mission Museum
- Visit the Gandhi Hall
- Explore the local markets
- Depart from Indore
";
def extract_activities(input_text)
  activities = []
  activity_keywords = ["swimming", "hiking", "walking", "cycling", "dancing", "yoga","boating"]
  words = input_text.split(" ")
  words.each do |word|
    if activity_keywords.include?(word)
      activities << word
    end
  end
  return activities.uniq
end


def create_itinerary(input_string)
  cities = {
    "Delhi" => ["Red Fort", "India Gate", "Lotus Temple"],
    "Mumbai" => ["Gateway of India", "Marine Drive", "Elephanta Caves"],
    'Jaipur'=>['Amber Fort','City Palace','Jantar Mantar','Hawa Mahal','Jal Mahal','Birla Temple'],
    'Jodhpur'=>['Mehrangarh Fort','Jaswant Thada Memorial'],
    'Udaipur'=>['City Palace','Jagdish Temple'],
    'Jaisalmer'=>['Golden Fort','Patwon Ki Haveli','Gadisar Lake'],
    "Bangalore" => ["Lal Bagh", "Cubbon Park", "Bull Temple"],
    "Chennai" => ["Marina Beach", "Mahabalipuram", "Fort St. George"],
    "Hyderabad" => ["Charminar", "Golconda Fort", "Hussain Sagar"],
    "Kolkata" => ["Victoria Memorial", "Howrah Bridge", "Park Street"],
    'Indore'=>['Rajwada Palace','Sarafa Bazaar',
      'Annapurna Temple',
     ' Lal Bagh Palace ', 'Central Museum',
      'Khajrana Ganesh Temple',
      'Patalpani Waterfall',
      'Tincha Falls',
      'Pisanhari Ki Madhi',
      'Chhappan Dukaan',
      'Shri Omkareshwar' ,'Jyotirlinga Temple',
      'Mandu Fort',
      'Jahaz Mahal',
      'Hindola Mahal',
      'Tshai waterfall',
      'Ujjain city',
      'Ujjain Mahakal Temple',
      'Gomatgiri Jain Temple',
      'Ram Krishna Mission Museum',
      'Gandhi Hall']
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
act=extract_activities(data);
act.each do |x|
  puts x;
end


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

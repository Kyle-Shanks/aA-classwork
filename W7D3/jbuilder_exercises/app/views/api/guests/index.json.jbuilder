# json.array! @guests, :id, :name, :age, :favorite_color
json.array! @guests.select {|g| (40..50).include?(g.age)}, :id, :name, :age, :favorite_color

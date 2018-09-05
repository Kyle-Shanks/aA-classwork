json.extract! @party, :id, :name, :location

json.guests do
  # making a guest key
  json.array! @party.guests do |guest|
    json.extract! guest, :id, :name, :age
    #making the key of guest
    json.gifts do
      json.array! guest.gifts do |gift|
        json.extract! gift, :id, :title, :description
      end
    end
  end
end

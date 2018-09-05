json.extract! @guest, :id, :name, :age, :favorite_color

json.gifts do
  json.array! @gifts.select {|gift| gift.guest_id == @guest.id }, :id, :title, :description, :guest_id
end

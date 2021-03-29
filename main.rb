require_relative 'connection'
require_relative 'models'

puts "--- Render Clients ---"
clients = Client.all
clients.each do |client|
    puts client.lastname + " : " + client.firstname
end

puts "--- Cheapest products ---"
products = Product.cheap
products.each do |product|
    puts product.name + " : " + product.price.to_s
end
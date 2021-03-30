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

quantity = 20
puts "--- Ordered items with an amount of " + quantity.to_s + " at less ---"
orderItems = OrderItem.bulk(quantity)
orderItems.each do |orderItem|
    puts orderItem.product.name + " : " + orderItem.quantity.to_s + " (Ordered by " + orderItem.order.client.firstname + " " + orderItem.order.client.lastname + ")"
end 

# Version avec détails (Exigence 3 -> last line)
# client = Client.first
# puts "### Produits pas cher commandé par #{client}"
# client.ordered_products.cheap.each do |product|
#   puts "  #{product.name} trouvé dans #{product.orders.count} commandes"
# end
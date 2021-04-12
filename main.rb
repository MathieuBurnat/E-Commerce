require_relative 'connection'
require_relative 'models'

puts "---  [#{Individual.amount.to_s}] Render Individuals ---"
clients = Individual.all
clients.each do |client|
    puts client.lastname + " : " + client.firstname
end

puts "---  [#{Entreprise.amount.to_s}] Render Entreprises ---"
entreprises = Entreprise.all
entreprises.each do |entreprise|
    puts entreprise.company_name
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

# client = Client.where('id = ?', 1).first
client = Client.find(1)
puts "--- Total of the last order of the client " + client.firstname + " " + client.lastname + " ---"
puts client.orders.last.total_price.to_s

suppliers = Supplier.all()
puts "---  [#{Supplier.amount.to_s}] Render Suppliers ---"
suppliers.each do |supplier|
    puts "#{supplier.name} has : " 
    p supplier.categories
end
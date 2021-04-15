require_relative 'connection'
require_relative 'models'

puts "A ---  [#{Individual.amount.to_s}] Render Individuals ---"
clients = Individual.all
clients.each do |client|
    puts client.lastname + " : " + client.firstname
end

puts "B ---  [#{Entreprise.amount.to_s}] Render Entreprises ---"
entreprises = Entreprise.all
entreprises.each do |entreprise|
    puts entreprise.company_name
end

puts "C --- Cheapest products ---"
products = Product.cheap
products.each do |product|
    puts product.name + " : " + product.price.to_s
end

quantity = 10
puts "D --- Ordered items with an amount of " + quantity.to_s + " or more ---"
orderItems = OrderItem.bulk(quantity)
orderItems.each do |orderItem|
    puts orderItem.product.name + " : " + orderItem.quantity.to_s + " (Ordered by " + orderItem.order.client.firstname + " " + orderItem.order.client.lastname + ")"
end 


# Version avec détails (Exigence 3 -> last line)
client = Client.find(1)
puts "E --- Cheapest products commanded by  #{client.firstname} #{client.lastname} ---"
products = client.cheapest_ordered_items

products.each do |product|
    p product
end

# client = Client.where('id = ?', 1).first
client = Client.find(1)
puts "F --- Total of the last client's order " + client.firstname + " " + client.lastname + " ---"
puts client.orders.first.total_price.to_s

suppliers = Supplier.all()
puts "G ---  [#{Supplier.amount.to_s}] Suppliers ---"
suppliers.each do |supplier|
    puts "#{supplier.name} has : " 
    supplier.categories.each do |cat|
        puts "- #{cat.name}" 
    end
    puts "Score : #{Comment.supplier_score(supplier)} | 10" 
end

order_most_expensive = Order.most_expensive
puts "H.1 --- The most expansive order ---"
puts "Ordred by #{order_most_expensive.client.firstname} #{order_most_expensive.client.lastname}"
puts "Created at #{order_most_expensive.created_at}"
puts "Order's price : #{order_most_expensive.total_price}"

puts "H.2 --- Categories not interested by clients ---"
p Category.not_commanded
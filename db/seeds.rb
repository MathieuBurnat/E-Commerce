require_relative '../models'

# Create clients
mathieu = Client.create(firstname: "Mathieu", lastname: "BlackCat")

Client.create(firstname: "Jerome", lastname: "Hedgedoc")
Client.create(firstname: "Henri", lastname: "Wolf")
Client.create(firstname: "Simon", lastname: "Bunny")

# Create categories (with another method)

# Note : The method .new(..).save could create errors an object try to associate the variable as Forein Key.
Category.new(name: "Sport", description: "To all berserkers in the soul...").save

# Stock catageories in variable to associate them later
it = Category.create(name: "IT", description: "Techno-Shop")
desktop = Category.create(name: "Desktop", description: "Funny goodies :D")


# Create products (with object's associations)
Product.create(name: "RedKeyboard", price: 98.20, description: "Look at these beautiful keys", category: it)
pencil = Product.create(name: "Pencil", price: 5.10, description: "We love it.", category: desktop)
eraser = Product.create(name: "Eraser", price: 7.20, description: "THE Eraser.", category: desktop)

# Create the object with .new to update it dynamically and save it at the end
# This move is used to avoid validation's problem that might be come at the next chapter
order = mathieu.orders.new
order.order_items.new(product: eraser, quantity: 24, item_price: eraser.price)
order.order_items.new(product: pencil, quantity: 1, item_price: pencil.price)
order.save

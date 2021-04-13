require_relative '../models'

# Create clients
mathieu = Individual.create(firstname: "Mathieu", lastname: "BlackCat")

Individual.create(firstname: "Jerome", lastname: "Hedgedoc")
Individual.create(firstname: "Henri", lastname: "Wolf")
Entreprise.create(company_name: "RubbyShop")
Entreprise.create(company_name: "EatMe")
nastlet = Supplier.create(name: "Nastlet")
caoutchouka = Supplier.create(name: "caoutchouka")

# Create categories (with another method)

# Note : The method .new(..).save could create errors an object try to associate the variable as Forein Key.
Category.new(name: "Sport", description: "To all berserkers in the soul...").save

# Stock catageories in variable to associate them later
it = Category.create(name: "IT", description: "Techno-Shop")
desktop = Category.create(name: "Desktop", description: "Funny goodies :D")
deco = Category.create(name: "Decoration", description: "Upgrade your home with beautiful decoration")

# Create products (with object's associations)
keyboard = Product.create(name: "RedKeyboard", price: 98.20, description: "Look at these beautiful keys", category: it, supplier: caoutchouka)
Product.create(name: "Start", price: 25.90, description: "Look at it it sparkles !", category: deco, supplier: nastlet)
Product.create(name: "Josef", price: 5, description: "The Josef's poster. A2", category: deco, supplier: caoutchouka)

pencil = Product.create(name: "Pencil", price: 5.10, description: "We love it.", category: desktop, supplier: nastlet)
eraser = Product.create(name: "Eraser", price: 7.20, description: "THE Eraser.", category: desktop, supplier: nastlet)

# Create the object with .new to update it dynamically and save it at the end
# This move is used to avoid validation's problem that might be come at the next chapter
order = mathieu.orders.new
order.order_items.new(product: eraser, quantity: 24, item_price: eraser.price)
order.order_items.new(product: pencil, quantity: 1, item_price: pencil.price)
order.save

Comment.create(client: mathieu, comment: "Was fast and very gentle !", mark: 9, supplier: nastlet)
Comment.create(client: mathieu, comment: "Did i like this product ? Meeeeh", mark: 1, product: keyboard)
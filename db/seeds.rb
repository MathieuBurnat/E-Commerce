require_relative '../models'

# ------ Create clients ------
# Individuals
mathieu = Individual.create(firstname: "Mathieu", lastname: "BlackCat")
simon = Individual.create(firstname: "Simon", lastname: "Bunny")
Individual.create(firstname: "Jerome", lastname: "Hedgedoc")
Individual.create(firstname: "Henri", lastname: "Wolf")

# Entreprises
Entreprise.create(company_name: "RubbyShop")
Entreprise.create(company_name: "EatMe")

# Suppliers
nastlet = Supplier.create(name: "Nastlet")
caoutchouka = Supplier.create(name: "caoutchouka")

# ------ Create categories ------
# Note : The method .new(..).save could create errors an object try to associate the variable as Forein Key.
Category.new(name: "Sport", description: "To all berserkers in the soul...").save

# Stock catageories in variable to associate them later
it = Category.create(name: "IT", description: "Techno-Shop")
desktop = Category.create(name: "Desktop", description: "Funny goodies :D")
deco = Category.create(name: "Decoration", description: "Upgrade your home with beautiful decoration")

# ------ Create products (with object's associations) ------
keyboard = Product.create(name: "RedKeyboard", price: 98.20, description: "Look at these beautiful keys", category: it, supplier: caoutchouka)
star = Product.create(name: "Star", price: 25.90, description: "Look at it it sparkles !", category: deco, supplier: nastlet)
josef = Product.create(name: "Josef", price: 5, description: "The Josef's poster. A2", category: deco, supplier: caoutchouka)

pencil = Product.create(name: "Pencil", price: 5.10, description: "We love it.", category: desktop, supplier: nastlet)
eraser = Product.create(name: "Eraser", price: 7.20, description: "THE Eraser.", category: desktop, supplier: nastlet)

# ------ Create orders ------
# Create the object with .new to update it dynamically and save it at the end
# This move is used to avoid validation's problem because a validation could be executed before that a value is filled.
order = mathieu.orders.new
order.order_items.new(product: eraser, quantity: 24, item_price: eraser.price)
order.order_items.new(product: pencil, quantity: 1, item_price: pencil.price)
order.save

order = simon.orders.new
order.order_items.new(product: star, quantity: 101, item_price: star.price)
order.order_items.new(product: josef, quantity: 2, item_price: josef.price)
order.save

Comment.create(client: mathieu, comment: "Was fast and very gentle !", mark: 9, supplier: nastlet)
Comment.create(client: mathieu, comment: "Did i like this product ? Meeeeh", mark: 1, product: keyboard)
Comment.create(client: simon, comment: "OMFG IT REALLY SPARKLES", mark: 10, product: star)
Comment.create(client: simon, comment: "Awesome.", mark: 8, supplier: nastlet)
Comment.create(client: simon, comment: "what ? why did i buy this thing..", mark: 2, product: josef)
Comment.create(client: simon, comment: "Not polite, try to force me to buy a looooot of other products [....] I don't recommend.", mark: 2, supplier: caoutchouka)
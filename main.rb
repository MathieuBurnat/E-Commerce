require_relative 'connection'
require_relative 'models'

puts "--- Render Clients ---"
clients = Client.all
clients.each do |client|
    puts client.lastname + " : " + client.firstname
end
class Order < ActiveRecord::Base
    belongs_to :client
    has_many :order_items
    has_many :products, through: :order_items

    validates :client, :order_items, presence: true 
    
    #Cascading validation
    validates_associated :order_items
    
    def total_price
        #order_items.sum(&:price)
        #Similar to :
        order_items.sum {|item| item.price}
    end
end
  
class Order < ActiveRecord::Base
    belongs_to :client
    has_many :order_items
    has_many :products, through: :order_items

    validates :client, :order_items, presence: true 
    
    #Cascading validation
    validates_associated :order_items

    def self.created_between(range_start, range_end)
        all.find_all {|order| order.created_at.between?(range_start, range_end) }
    end

    # All orders be simply get with the key word "all"
    # After that, it became possible to sort orders by price
    def self.order_by_price
        all.sort_by {|order| order.total_price}
    end
    
    def self.most_expensive
        order_by_price.last
    end

    # Also possible
    # def self.most_expensive
    #     all.max_by(&:price)
    # end

    def total_price
        #order_items.sum(&:price)
        #Similar to :
        order_items.sum {|item| item.price}
    end
end
  
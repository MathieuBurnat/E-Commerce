class Category < ActiveRecord::Base
    has_many :products
    has_many :suppliers, through: :products

    validates :name, length: {minimum: 2, maximum: 50}

    def self.order_by_price
        all.sort_by {|order| order.total_price}
    end
    
    def self.most_expensive
        order_by_price.last
    end
end
class Client < ActiveRecord::Base
    has_many :orders

    # Distinct is used to avoid data repetitions (sounds like the unique tag in SQL)
    has_many :ordered_products, lambda { distinct }, through: :orders, source: :products

    scope :amount, -> { count("*") }

    def self.done_any_order
        all.find_all {|client| client.orders.empty? }
    end

    def cheapest_products_ordered
        self.ordered_products.cheap
    end
end
  
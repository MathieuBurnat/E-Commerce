class Client < ActiveRecord::Base
    has_many :orders

    # Distinct is used to avoid data repetitions (sounds like the unique tag in SQL)
    has_many :ordered_products, lambda { distinct }, through: :orders, source: :products

    scope :amount, -> { count("*") }

    # * Notes
    # In this test i tried to implement two inner join with the method .joins.
    # Unfortunately, it doesn't works properly so I had to <rethink> about my queries and adapt the code..
    def cheapest_ordered_items
        # Get all ordered_items of the client
        products = []
        

        datas = Order.select("*").joins("order_items").where("client_id = #{self.id}")

        # Get product from ordred_item
        datas.each do |ordered_items|
            ordered_items.order_items.each do |product|
                products.push(self.get_products(product.product_id))
            end 
        end 

        # Return an array of products
        return products
    end

    # Get the product if is cheap
    def get_products(id)
        p Product.select("*").where("id = #{id}").cheap
    end
end
  
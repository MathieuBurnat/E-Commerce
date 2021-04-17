class Category < ActiveRecord::Base
    has_many :products
    has_many :suppliers, through: :products

    validates :name, length: {minimum: 2, maximum: 50}

    def self.commanded
        all.find_all {|category| category.products.all? {|product| product.order_items.exists? } }
    end

    def self.not_commanded
        all.find_all {|category| category.products.all? {|product| product.order_items.empty? } }
    end
    
    # ### Ex2-suite-2-variante-b
    # def self.never_ordered_b
    # # needs   has_many :order_items, through: :products
    # all.find_all {|category| category.order_items.empty? }
    # end

    # ### Ex2-suite-2-variante-c
    # def self.never_ordered_c
    # # needs has_many :orders, through: :products
    # where.not(id: joins(:orders))
    # end
end
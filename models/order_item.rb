class OrderItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :order

    validates :product, :order, presence: true
    validates :quantity, numericality: { greater_or_equal_than: 1, only_integer: true}

    # Set a default value : In this case it'll be 100
    scope :bulk, ->(size = 100) { where('quantity >= ?', size) }

    before_save :set_price

    # Define the price of the order_item
    def price
        quantity * item_price
    end

    protected def set_price
        # Set the price the default value if no other values are set
        # This option could be interesting if a price's discout exists
        self.item_price ||= product.price
        
        # Method "unfolded"
        # self.item_price = self.item_price || product.price
    
        #Note : The "self." key-word is set to use the actual variable whitout needs to create a new one
    end
end
  
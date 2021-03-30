class OrderItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :order

    validates :product, :order, presence: true
    validates :quantity, numericality: { greater_or_equal_than: 1, only_integer: true}

    # Set a default value : In this case it'll be 100
    scope :bulk, ->(size = 100) { where('quantity >= ?', size) }

    # Define the price of the order_item
    def price
        quantity * item_price
    end
end
  
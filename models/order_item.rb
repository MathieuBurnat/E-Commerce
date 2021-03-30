class OrderItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :order

    # Set a default value : In this case it'll be 100
    scope :bulk, ->(size = 100) { where('quantity >= ?', size) }
end
  
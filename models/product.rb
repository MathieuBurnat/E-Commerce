class Product < ActiveRecord::Base
    belongs_to :category
    has_many :orders, through: :order_items
end
  
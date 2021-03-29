class Product < ActiveRecord::Base
    belongs_to :category
    has_many :orders, through: :order_items

    scope :cheap, -> { where("products.price <= ?", 20) }


end
  
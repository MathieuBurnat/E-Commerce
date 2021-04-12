class Product < ActiveRecord::Base
    belongs_to :category
    belongs_to :client

    has_many :orders, through: :order_items

    validates :category, presence: true
    validates :name, length: {minimum: 2, maximum: 50}
    validates :price, numericality: {greater_than: 0}

    scope :cheap, -> { where("products.price <= ?", 20) }
end
  
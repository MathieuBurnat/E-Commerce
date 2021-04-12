class Category < ActiveRecord::Base
    has_many :products
    has_many :suppliers, through: :products

    validates :name, length: {minimum: 2, maximum: 50}
end
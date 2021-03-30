class Client < ActiveRecord::Base
    has_many :orders

    # Distinct is used to avoid data repetitions (sounds like the unique tag in SQL)
    has_many :ordered_products, lambda { distinct }, through: :orders, source: :products

    validates :firstname, length: {minimum: 3, maximum: 20}
    validates :lastname, length: {minimum: 3, maximum: 20}
end
  
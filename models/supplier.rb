class Supplier < ActiveRecord::Base
    validates :name, length: {minimum: 3, maximum: 20}

    # Distinct is used to avoid data repetitions (sounds like the unique tag in SQL)
    has_many :categories, -> { distinct }, through: :products
    has_many :products
end
  
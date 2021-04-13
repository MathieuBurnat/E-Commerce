class Supplier < ActiveRecord::Base
    
    has_many :products
    
    #Distinct is used to avoid data repetitions (sounds like the unique tag in SQL)
    has_many :categories, -> { distinct }, through: :products
    has_many :comments

    validates :name, length: {minimum: 3, maximum: 20}

    scope :amount, -> { count("*") }
end
  
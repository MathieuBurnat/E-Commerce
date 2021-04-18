class Supplier < ActiveRecord::Base
    
    has_many :products
    
    #Distinct is used to avoid data repetitions (sounds like the unique tag in SQL)
    has_many :categories, -> { distinct }, through: :products
    has_many :comments

    validates :name, length: {minimum: 3, maximum: 20}

    scope :amount, -> { count("*") }

    def get_score
        marks = self.comments.pluck("mark")
        return marks.sum(0.0) / marks.size
    end
end
  
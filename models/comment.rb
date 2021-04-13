class Comment < ActiveRecord::Base
    belongs_to :client
    belongs_to :product
    belongs_to :supplier

    validates :comment, length: {minimum: 4, maximum: 3000}
    validates :mark, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 10}
end
  
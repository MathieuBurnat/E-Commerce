class Individual < Client
    validates :firstname, length: {minimum: 3, maximum: 20}
    validates :lastname, length: {minimum: 3, maximum: 20}
end
  
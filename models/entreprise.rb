class Entreprise < Client
    validates :company_name, length: {minimum: 3, maximum: 20}
end
  
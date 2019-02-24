class Buyer < User
  default_scope { where(role: 'buyer')}

  has_many :invoices
end

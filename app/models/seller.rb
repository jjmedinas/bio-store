class Seller < User
  default_scope { where(role: 'seller')}

  has_many :invoices
end

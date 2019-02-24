class InvoiceSerializer < ActiveModel::Serializer
  attributes :identifier, :seller, :buyer, :description, :total, :sending_address

  def seller
    User.find_by(id: self.object.seller_id).name
  end

  def buyer
    User.find_by(id: self.object.buyer_id).name
  end
end

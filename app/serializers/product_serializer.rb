class ProductSerializer < ActiveModel::Serializer
  attributes :name, :slug, :description, :stock, :price, :category, :images


  def images
    if self.object.images.attached?
      self.object.images.map{|i|
        Rails.application.routes.url_helpers.rails_blob_url(i, host: ENV['HOST'])
      }
    else
      []
    end
  end

  def category
    category = self.object.category
    {
      name: category.name,
      slug: category.slug
    }
  end
end

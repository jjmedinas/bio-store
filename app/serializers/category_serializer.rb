class CategorySerializer < ActiveModel::Serializer
  attributes :name, :slug, :image

  def image
    Rails.application.routes.url_helpers.rails_blob_url(self.object.image, host: ENV['HOST'])
  end
end

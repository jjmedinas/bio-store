class CategorySerializer < ActiveModel::Serializer
  attributes :name, :slug, :image

  def image
    if self.object.image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(self.object.image, host: ENV['HOST'])
    end
  end
end

class Category < ApplicationRecord

  validates :name, presence: true

  before_save :set_identifier
  before_save :set_slug

  has_one_attached :image


  private
    def set_identifier
      self.identifier ||= SecureRandom.uuid
    end

    def set_slug
      self.slug ||= "#{name.parameterize}-#{identifier}"
    end
end

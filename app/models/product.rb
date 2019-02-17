class Product < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :stock, presence: true
  validates :price, presence: true

  before_save :set_identifier
  before_save :set_slug

  has_many_attached :images
  belongs_to :category
  belongs_to :user


  private
    def set_identifier
      self.identifier ||= SecureRandom.uuid
    end

    def set_slug
      self.slug ||= "#{name.parameterize}-#{identifier}"
    end
end

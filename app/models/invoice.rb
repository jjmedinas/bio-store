class Invoice < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  before_save :set_identifier

  validates :description, presence: true
  validates :total, presence: true

  private
    def set_identifier
      self.identifier ||= SecureRandom.uuid
    end
end

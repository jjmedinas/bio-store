class Invoice < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer

  before_save :set_identifier

  validates :description, presence: true
  validates :total, presence: true

  private
    def set_identifier
      self.identifier ||= SecureRandom.uuid
    end
end

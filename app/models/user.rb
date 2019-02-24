class User < ApplicationRecord
  before_save   :downcase_email

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z]+[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  ROLES = ['buyer', 'seller', 'admin']
  STATES = ['active', 'blocked']

  validates :name,  presence: true
  validates :nickname,  presence: true
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password,  presence: true, length: { minimum: 8 }, allow_nil: true

  devise :database_authenticatable,
         :registerable, :validatable,
         :rememberable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist


  def block!
    self.update_attributes(state: 'blocked')
  end

  def unblock!
    self.update_attributes(state: 'active')
  end

  def buyer?
    self.role == "buyer"
  end

  def seller?
    self.role == "seller"
  end

  private

    def downcase_email
      self.email.downcase!
    end
end

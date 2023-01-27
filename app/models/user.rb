class User < ApplicationRecord

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

  validates :first_name, :last_name, :email, presence: true
  validates :password, length: { minimum: 4 }
  validate :email_is_unique
  def email_is_unique
    check = User.find_by_email(email)
    if check
      errors.add(:email, "can't already have account already associated with it")
    end
  end
end

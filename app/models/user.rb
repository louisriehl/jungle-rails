class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password

  validates :password, presence: true, confirmation: true, length: {minimum: 5}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :name, presence: true

  before_save :downcase_email

  def self.authenticate_with_credentials(email, password)
    @email = trim_spaces(email)
    @user = User.find_by_email(@email.downcase)

    # byebug

    if @user && @user.authenticate(password)
      @user
    end
  end

  private
    def self.trim_spaces(string)
      string.tr(' ', '')
    end

    def self.downcase_email
      self.email.downcase!
    end

end

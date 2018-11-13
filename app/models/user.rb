class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password

  validates :password, presence: true, confirmation: true, length: {minimum: 5}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :name, presence: true

  before_save :downcase_email

  def authenticate_with_credentials(email, password)
    @email = trim_spaces(email)
    @user = User.find_by_email(@email.downcase)

    if @user && @user.authenticate(password)
      @user
    end
  end

  private
    def trim_spaces(string)
      string.tr(' ', '')
    end

    def downcase_email
      self.email.downcase!
    end

end

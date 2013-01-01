class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  					:first_name, :last_name, :profile_name
  # attr_accessible :title, :body
  has_many :statuses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true, uniqueness: true
  validates :profile_name,
            format: {
              with: /^[a-zA-Z0-9_-]+$/,
              message: 'must be formatted correctly.'
            }
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  # validates :email, presence: true

	def full_name
		first_name + " " + last_name
	end

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)
    "http://gravatar.com/avatar/#{hash}"
  end

end




















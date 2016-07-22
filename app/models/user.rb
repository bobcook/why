class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :posts
  has_many :ask_whies

  # validate :username_content_type
  # validates :username, uniqueness: { case_sensitive: false }
  # validates_length_of :username, minimum: 4, maximum: 16

  after_create :user_profile
  
  def user_profile
    build_profile.save
  end

  def user_image
    profile.image.url
  end

  # def username_content_type
  #   validate = Regexp.new( '^[a-zA-Z0-9_]*$' );
  #   validate.match(self.username)
  # end

end
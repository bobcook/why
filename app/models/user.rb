class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  after_create :user_profile
  
  def user_profile
    build_profile.save
  end

  def user_image
    profile.image.url
  end
end

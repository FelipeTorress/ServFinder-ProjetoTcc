class User < ApplicationRecord
  before_save :email_downcase
  before_save :select_profile_photo

  has_many :services
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50}
  validates :accepted_terms_of_use, presence: true
  validates :accepted_privacy_policy, presence: true

  COLOR_PROFILE = ['blue','green', 'purple', 'red', 'yellow', 'blueLight', 'brown', 'pinkLight', 'pink']

  def email_downcase
    self.email = email.downcase
  end

  def select_profile_photo
    color = COLOR_PROFILE[rand(9)]
    self.profile_photo = "profile/profile-#{color}.jpg"
  end
end

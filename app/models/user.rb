class User < ApplicationRecord
  before_save :email_downcase

  has_many :services
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50}
  validates :accepted_terms_of_use, presence: true
  validates :accepted_privacy_policy, presence: true

  def email_downcase
    self.email = email.downcase
  end
end

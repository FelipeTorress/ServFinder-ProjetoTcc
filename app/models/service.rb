class Service < ApplicationRecord
  validates :title, presence: true, length: {minimum: 6, maximu: 50}
  validates :description, presence: true, length: {minimum: 10, maximu: 300}
  belongs_to :user
end
class Service < ApplicationRecord
  before_save :cover_photo

  validates :title, presence: true, length: {minimum: 6, maximu: 50}
  validates :description, presence: true, length: {minimum: 10, maximu: 300}
  validates :value, presence: true
  belongs_to :user

  COVER_PHOTO = [
    'https://th.bing.com/th/id/OIP.onDF7JHsWyC3XjGBV1CAywHaEK?w=287&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.NnFdFUoNOH_BbY1eLB44zwHaE8?w=246&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.DtmyNKuZiWvC6Ezll5C7MAHaCO?w=323&h=104&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.vfPV_SkasH-Iscmyrtdo2gHaER?w=273&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.FXAKgRzyp8lkJQHLYyhDFgHaCs?w=325&h=127&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.pKAJ1XROcd9bQTKYbwg5xAHaDZ?w=305&h=160&c=7&r=0&o=5&pid=1.7'
  ].freeze

  def cover_photo
    self.cover_photo = COVER_PHOTO[rand(6)]
  end
end

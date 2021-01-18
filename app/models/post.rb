class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  with_options presence: true do
    validates :title
    validates :sports
    validates :datetime
    validates :address
    validates :cost
    validates :content
    validates :flow
  end

  validates :image, presence: {message: 'を選択してください。'}
end

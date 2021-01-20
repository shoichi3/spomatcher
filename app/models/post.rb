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

  def liked_by?(user, post)
    Favorite.where(user_id: user.id, post_id: post.id).exists?
  end
end

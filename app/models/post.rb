class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  acts_as_taggable

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

  validates :image, presence: { message: 'を選択してください。' }

  def liked_by?(user, post)
    Favorite.where(user_id: user.id, post_id: post.id).exists?
  end

  def create_notification_favorite!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and post_id = ? and action = ?', current_user.id, user_id, id,
                               'favorite'])
    return unless temp.blank?

    notification = current_user.active_notifications.new(
      visited_id: user_id,
      post_id: id,
      action: 'favorite'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%").includes([:user, :tags])
    else
      Post.all.includes([:user, :tags])
    end
  end
end

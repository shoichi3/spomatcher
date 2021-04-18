class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include CreateFollowNotificationService
  include CalculateAverageScoreService
  include ComfirmFollowingService
  include FollowUserService
  include UnfollowUserService
  # include LoginGuestUserService
  include UpdateWithoutCurrentPasswordService

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image

  has_many :posts, dependent: :destroy

  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :messages, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :following_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :followers, through: :follower_relationships

  has_many :reviews, foreign_key: 'reviewee_id', dependent: :destroy

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  validates :name, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  with_options format: { with: PASSWORD_REGEX, message: 'には半角英数字の両方が必要です。' } do
    validates :password, on: :create
  end
end

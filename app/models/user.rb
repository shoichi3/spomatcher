class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :favorites
  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "following_id"
  has_many :followers, through: :follower_relationships
  has_many :reviews, foreign_key: "reviewee_id"

  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id"
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id"
  
  validates :name, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options format: { with: PASSWORD_REGEX, message: 'には半角英数字の両方が必要です。' } do
    validates :password, on: :create
  end
  
  def self.guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
    end
  end
  
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    
    if params[:password].blank? && params[:password_confirmation].blank?
      
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  #フォローしているかを確認するメソッド
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  #フォローするときのメソッド
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  #フォローを外すときのメソッド
  def unfollow(user)
    following_user = following_relationships.find_by(following_id: user.id) 
    following_user.destroy
  end

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f
    end
  end
end

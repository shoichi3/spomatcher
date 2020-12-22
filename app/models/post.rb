class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  with_options presence: true do
    validates :title
    validates :sports
    validates :datetime
    validates :region
    validates :cost
    validates :content
    validates :flow
  end

  validates :image, presence: {message: 'を選択してください。'}
end

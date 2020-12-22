class Post < ApplicationRecord
  has_one_attached :image
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  belongs_to :user
end

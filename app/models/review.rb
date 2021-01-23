class Review < ApplicationRecord
  validates :content, presence: true
  validates :score, presence: true
  belogns_to :reviewer, class_name: "User", foreign_key: "reviewer_id"
  belogns_to :reviewee, class_name: "User", foreign_key: "reviewee_id"
end

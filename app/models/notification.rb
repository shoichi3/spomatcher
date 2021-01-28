class Notification < ApplicationRecord
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  belongs_to :post, optional: true
  belongs_to :room, optional: true
  belongs_to :review, optional: true

  ACTION_VALUES = %w(message favorite follow review).freeze
  validates :action, presence: true, inclusion: { in: ACTION_VALUES }
end

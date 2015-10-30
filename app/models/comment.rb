class Comment < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 100 }
end

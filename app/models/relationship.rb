class Relationship < ActiveRecord::Base
  include CreateActivity
  after_create :follow_activity
  after_destroy :unfollow_activity

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def follow_activity
    create_activity followed_id, Settings.activity_type.follow, Settings.activity_type.user, follower_id
  end

  def unfollow_activity
    create_activity followed_id, Settings.activity_type.unfollow, Settings.activity_type.user, follower_id
  end
end

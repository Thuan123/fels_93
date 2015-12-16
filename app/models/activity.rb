class Activity < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :target_id, presence: true
  validates :target_type, presence: true
  validates :type_id, presence: true

  scope :order_by,-> {order created_at: :DESC}
end

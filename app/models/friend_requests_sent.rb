class FriendRequestsSent < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :counter_cache => true

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :friend_requests_count

  # Indirect associations

  # Validations

  validates :recipient_id, :uniqueness => { :scope => [:sender_id] }

  validates :recipient_id, :presence => true

end

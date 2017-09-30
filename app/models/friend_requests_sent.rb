class FriendRequestsSent < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :recipient_id, :uniqueness => { :scope => [:sender_id] }

  validates :recipient_id, :presence => true

end

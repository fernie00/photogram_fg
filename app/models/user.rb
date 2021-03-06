class User < ApplicationRecord
  # Direct associations

  has_many   :friend_requests_sents,
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :friend_requests,
             :class_name => "FriendRequestsSent",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :photos,
             :foreign_key => "poster_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :likes,
             :through => :photos,
             :source => :likes

  has_many   :comments,
             :through => :photos,
             :source => :comments

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

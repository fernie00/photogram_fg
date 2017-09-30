class Photo < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :poster,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

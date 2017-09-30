class Photo < ApplicationRecord
  # Direct associations

  belongs_to :poster,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

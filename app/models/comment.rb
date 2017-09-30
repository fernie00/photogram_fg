class Comment < ApplicationRecord
  # Direct associations

  belongs_to :photo,
             :counter_cache => true

  # Indirect associations

  has_one    :poster,
             :through => :photo,
             :source => :poster

  # Validations

end

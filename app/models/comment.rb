class Comment < ApplicationRecord
  belongs_to :user

  # Polymorphism
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

end
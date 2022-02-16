class Hashtag < ApplicationRecord
  #assosiation
  belongs_to :tagable, polymorphic: true
end

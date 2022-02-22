##====schema information
#
##table name-->sports
#
#t.string "name"

class Sport < ApplicationRecord
  #validation
  validate :name, presence: true

  #assosiation
  has_many :posts
  has_many :announcements
end

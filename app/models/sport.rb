##====schema information
#
##table name-->sports
#
#t.string "name"

class Sport < ApplicationRecord
  #assosiation
  has_many :posts
  has_many :announcements
end

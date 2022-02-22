##====schema information
#
##table name-->achievements
#
#string: "award"
#string: "medal"

class Achievement < ApplicationRecord
    #validation
    validate :award, presence: true
    validate :medal, presence: true
    
    #assosiation
    belongs_to :user
end

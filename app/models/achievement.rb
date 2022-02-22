##====schema information
#
##table name-->achievements
#
#string: "award"
#string: "medal"

class Achievement < ApplicationRecord
    #validation
    validates :award, presence: true
    validates :medal, presence: true

    #assosiation
    belongs_to :user
end

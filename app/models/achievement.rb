##====schema information
#
##table name-->achievements
#
#string: "award"
#string: "medal"

class Achievement < ApplicationRecord
    #assosiation
    belongs_to :user
end

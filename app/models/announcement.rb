##====schema information
#
##table name-->annoumcements
#
# t.string "title"
# t.text "description"
# t.integer "sport_id"
# t.index ["sport_id"], name: "index_announcements_on_sport_id"

class Announcement < ApplicationRecord
  #assosiation
  belongs_to :sport
end

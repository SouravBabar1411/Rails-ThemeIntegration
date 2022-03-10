##====schema information
#
##table name-->posts
#
# t.string "title"
# t.text "description"
# t.string "tag"
# t.integer "sport_id"
# t.index ["sport_id"], name: "index_posts_on_sport_id"

class Post < ApplicationRecord
  #validation
  validates :title, presence: true
  validates :description, presence: true
  #validates :tag, presence: true

  #assosiation
  belongs_to :sport
end

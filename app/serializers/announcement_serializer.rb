class AnnouncementSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  #assosiation
  belongs_to :sport
end

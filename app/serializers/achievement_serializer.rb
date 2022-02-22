class AchievementSerializer < ActiveModel::Serializer
  attributes :id, :award, :medal

  #assosiation
  belongs_to :user
end

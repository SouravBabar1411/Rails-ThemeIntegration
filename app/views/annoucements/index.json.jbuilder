json.set! :data do
  json.array! @annoucements do |annoucement|
    json.partial! 'annoucements/annoucement', annoucement: annoucement
    json.url  "
              #{link_to 'Show', annoucement }
              #{link_to 'Edit', edit_annoucement_path(annoucement)}
              #{link_to 'Destroy', annoucement, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end
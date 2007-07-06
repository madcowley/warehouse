atom_feed(:url => controller.action_name == 'index' ? formatted_changesets_url(:atom) : formatted_public_changesets_url(:atom)) do |feed|
  if current_repository
    feed.title("Changesets for #{current_repository.name}")
  else
    feed.title("#{'Public ' if controller.action_name == 'public'}Changesets")
  end
  feed.updated(@changesets.first ? @changesets.first.created_at : Time.now.utc)

  @changesets.each do |changeset|
    feed.entry(changeset) do |entry|
      entry.title("##{changeset.revision}: #{truncate(changeset.message, 50)} by #{changeset.author}")
      entry.summary(simple_format(h(changeset.message)))
      entry.content("<ul>#{render :partial => "changes", :locals => { :changeset => changeset }}</ul>", :type => 'html')
      entry.author do |author|
        author.name(changeset.author)
      end
    end
  end
end
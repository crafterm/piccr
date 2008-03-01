atom_feed(:url => formatted_photos_url(:atom)) do |feed|
  feed.title("Piccr Photos")
  feed.updated(@photos.first ? @photos.first.created_at : Time.now.utc)

  @photos.each do |photo|
    feed.entry(photo) do |entry|
      entry.title(photo.filename)
      entry.content(image_tag(photo.public_filename(:small)) + content_tag(:p, photo.description))

      entry.author do |author|
        author.name(photo.uploaded_by)
      end
    end
  end
end
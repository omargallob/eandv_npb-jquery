xml.instruct!
xml.pic do
   @list.each do |place|
     xml.image  place.thumb.url(:small).to_s
     xml.ptitle place.navlabel
     xml.link view_page_parent_path("about", place.name)
  end
end


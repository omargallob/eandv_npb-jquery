xml.instruct!
xml.pic do
   @partners.each do |partner|
     xml.image  partner.photo.url(:pagesize).to_s
     xml.ptitle partner.title
     xml.link view_page_parent_path("services", partner.category.name)
  end
end


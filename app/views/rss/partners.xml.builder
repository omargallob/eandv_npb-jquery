xml.instruct!
xml.pic do
   @partners.each do |partner|
     xml.image  partner.photo.url(:pagesize).to_s
     xml.ptitle partner.title.upcase
     xml.link partner.url
  end
end


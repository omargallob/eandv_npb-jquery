xml.instruct!
xml.pic do
   @list.each do |place|
     xml.image  place.photo.url(:small).to_s
     xml.ptitle place.title
     xml.link "/search?search_query[country]="+place.title.gsub(/ /,'+')+"&search_query[states]="+place.locations.first.state.gsub(/ /,'+')+"&search_query[region]="+place.locations.first.county+"&search_query[area]=All&search_query[buy_rent]=All&search_query[price]=All&search_query[bedrooms]=All&search_query[zip]="

  end
end


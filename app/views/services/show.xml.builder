xml.instruct!
xml.service do
  xml.title_front @category.title_front
  xml.title_back @category.title_back
  xml.body truncate(@category.description.gsub(/<\/?[^>]*>/, ""), 120)
  xml.image_front @category.photo.url(:large)
  xml.image_back @category.photo.url(:large)

  if params[:id]
    xml.link @category.link_text, "path"=>services_par_path(@category)
    xml.subcategories do
      @category.subcategories.each do |subcategory|
        xml.subcategory do
          xml.title subcategory.title
          xml.body subcategory.description.gsub(/<\/?[^>]*>/, "")
          xml.link services_sub_path(@category.name.downcase,subcategory.name.downcase)
        end
      end
    end
  else
    xml.link @category.link_text+" + ",  "path"=>services_sub_path(@category.parent.name.downcase,@category.name.downcase)
  end

end
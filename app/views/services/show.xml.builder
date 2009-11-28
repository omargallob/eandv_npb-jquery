xml.instruct!
xml.category do
  xml.title @category.title
  xml.body @category.description.gsub(/<\/?[^>]*>/, "")
  xml.url @category.photo.url(:large)
  
  if params[:id]
    xml.link services_par_path(@category)
  else
    xml.link services_sub_path(@category.parent.name.downcase,@category.name.downcase)
  end

  xml.subcategories do
    @category.subcategories.each do |subcategory|
      xml.subcategory do
        xml.title subcategory.title
        xml.body subcategory.description.gsub(/<\/?[^>]*>/, "")
        xml.link services_sub_path(@category.name.downcase,subcategory.name.downcase)
      end
    end
  end
end
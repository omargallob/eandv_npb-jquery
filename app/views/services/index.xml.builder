xml.instruct!
xml.categories do
  @categories.each do |category|
    xml.category do
      xml.title category.title
      xml.body category.description.gsub(/<\/?[^>]*>/, "")
      xml.url category.photo.url(:large)
      xml.subcategories do
        category.subcategories.each do |subcategory|
          xml.subcategory do
            xml.title subcategory.title
            xml.body subcategory.description.gsub(/<\/?[^>]*>/, "")
            xml.link services_sub_path(category.title.downcase,subcategory.title.downcase)
          end
        end
      end
    end
  end
end
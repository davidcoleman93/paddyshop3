class Product < ActiveRecord::Base

has_many :posts, :dependent => :destroy
SEARCH_TYPES = ["title", "manufacturer", "category"]
def self.search(query)
    # where(:name, query) -> This would return an exact match of the query
	#if :type == "Title"
		where("title like ?", "%#{query}%")
		#where(type" like ?", "%#{query}%")
	#end
	#if :type == "Manufacturer"
	#	where("manufacturer like ?", "%#{query}%")
	#end
	#if :type == "Category"
	#	where("category like ?", "%#{query}%")
	#end
end

def self.manufacturer_search(query)
    # where(:name, query) -> This would return an exact match of the query
    where("manufacturer like ?", "%#{query}%") 
end

def self.category_search(query)
    # where(:name, query) -> This would return an exact match of the query
    where("category like ?", "%#{query}%") 
end

end

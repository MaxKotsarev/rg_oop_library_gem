module LibraryGem
	Book = Struct.new(:title, :author)

	class Author 
		attr_reader :name, :biography

		def initialize(name, biography='')
			@name, @biography = name, biography
		end
	end 

	class Reader 
		attr_reader :name, :email, :city, :street, :house

		def initialize(name, email, city, street, house = '')
			@name, @email, @city, @street, @house = name, email, city, street, house
		end
	end 

	class Order 
		attr_reader :book, :reader, :date

		def initialize(book, reader, date = DateTime.now )
			@book, @reader, @date = book, reader, date 
		end
	end 
end
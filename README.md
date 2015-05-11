# LibraryGem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'library_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install library_gem

## Usage

	require 'library_gem'
	
	#ADD SOME TEST DATA
	library = LibraryGem::Library.new 
	library.authors = [
		LibraryGem::Author.new("author 1", "author 1 was born in 1788"),
		LibraryGem::Author.new("author 2"),
		LibraryGem::Author.new("author 3"),
		LibraryGem::Author.new("author 4")
	]

	library.books = [
		LibraryGem::Book.new("Book 1", "author 1"),
		LibraryGem::Book.new("Book 2", "author 2"),
		LibraryGem::Book.new("Book 3", "author 3"),
		LibraryGem::Book.new("Book 4", "author 4")
	]

	library.readers = [
		LibraryGem::Reader.new('Ivan', 'Ivan@gmail.com', 'Dnepr', 'Karla Marksa'),
		LibraryGem::Reader.new('Petr', 'Petr@gmail.com', 'Dnepr', 'Gogolya', '5'),
		LibraryGem::Reader.new('Olga', 'Olga@gmail.com', 'Dnepr', 'Gagarina'),
		LibraryGem::Reader.new('Katya', 'Katya@gmail.com', 'Dnepr', 'Karla Marksa')
	]

	library.orders = [
		LibraryGem::Order.new("Book 1", "Ivan"),
		LibraryGem::Order.new("Book 2", "Petr"),
		LibraryGem::Order.new("Book 2", "Olga"),
		LibraryGem::Order.new("Book 1", "Katya"),
		LibraryGem::Order.new("Book 2", "Ivan"),
		LibraryGem::Order.new("Book 2", "Katya"),
		LibraryGem::Order.new("Book 3", "Olga"),
		LibraryGem::Order.new("Book 3", "Petr"),
		LibraryGem::Order.new("Book 4", "Ivan"),
		LibraryGem::Order.new("Book 1", "Katya")
	]


	# TEST CALL OF METHODS 
	library.most_popular_book
	# => The most popular book is 'Book 2'. It was ordered 4 times.

	library.top_reders_of("Book 1")
	# => Book 1 was taken by:
	# => - Katya (2 times)
	# => - Ivan (1 time)

	library.count_readers_of_top_books(3)
	# => Top 3 books was ordered by 4 readers.

	#library.save_to('./lirary_db.txt')

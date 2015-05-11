require "./library_gem/version"
require './library_gem/classes'
require 'date'

module LibraryGem
	class Library 
		attr_accessor :books, :orders, :readers, :authors

		def initialize
			@books, @orders, @readers, @authors = [], [], [], []
		end

		def top_reders_of(book)
			readers = count_same_items_in(@orders.select {|i| i.book == book}.map(&:reader)).sort_by{|k, v| v}.reverse 
			puts "#{book} was taken by:"
			readers.each do |k, v|
				puts "- #{k} (#{v} " + (v > 1? "times)" : "time)")
			end
		end

		def most_popular_book
			if orders.empty?
				puts "We have no orders.. Books are not popular today ;("
			else 
				books = sorted_by_orders
				puts "The most popular book is '#{books.keys[0]}'. It was ordered #{books.values[0]} times." 
			end
		end

		def count_readers_of_top_books(books_amount)
			top_books = sorted_by_orders.keys.first(books_amount)
			orders_with_top_books = @orders.select {|i| top_books.include? i.book} 
			count_readers = orders_with_top_books.map(&:reader).uniq.size
			puts "Top #{books_amount} books was ordered by #{count_readers} readers."
		end

		def save_to(file_name)
			File.open(file_name, 'w') {|f| f.write(Marshal.dump(self)) }
	    end

		def self.load_from(file_name)
			Marshal.load(File.read(file_name))
		end
		
		
		private 
		
		def count_same_items_in(array)
			array.inject(Hash.new(0)) {|h, k| h[k] += 1; h}
		end 

		def sorted_by_orders
			Hash[count_same_items_in(@orders.map(&:book)).sort_by{|k, v| v}.reverse]
		end
	end 
end








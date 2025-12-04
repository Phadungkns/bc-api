# frozen_string_literal: true

authors = [
  Author.create!(name: 'George Orwell'),
  Author.create!(name: 'J. K. Rowling'),
  Author.create!(name: 'Haruki Murakami'),
  Author.create!(name: 'Stephen King')
]

# Categories
categories = [
  Category.create!(name: 'Fiction'),
  Category.create!(name: 'Fantasy'),
  Category.create!(name: 'Horror'),
  Category.create!(name: 'Literature')
]

# Books
book1 = Book.create!(title: '1984', category: categories[0])
book2 = Book.create!(title: 'Harry Potter', category: categories[1])
book3 = Book.create!(title: 'Norwegian Wood', category: categories[3])

# Connect authors (Many-to-Many)
book1.authors << authors[0]
book2.authors << authors[1]
book3.authors << authors[2]

# Example: a Book with multiple authors
book_multi = Book.create!(title: 'Horror Collection', category: categories[2])
book_multi.authors << [authors[0], authors[1], authors[2]]

puts 'Seeding completed!'

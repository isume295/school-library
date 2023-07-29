require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require 'date'
require_relative 'rental'
class App
  def initialize
    @people = []
    @books = []
  end

  # list of books
  def display_books
    if @books.empty?
      puts 'No books available'
    else
      puts "List of Books:\n\n"
      @books.each do |book|
        puts "Title: #{book.title}\nAuthor: #{book.author}\n\n"
      end
    end
  end

  # list of people
  def display_people
    if @people.empty?
      puts 'List is empty'
    else
      puts "List of People:\n"
      @people.each do |person|
        puts "Name: #{person.name}\nAge: #{person.age}\nID: #{person.gets_id}\n\n"
      end
    end
  end

  # add person
  def add_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]:'
    type = gets.chomp.to_i
    case type
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]:'
    permission = gets.chomp.downcase
    parent_permission = true
    case permission
    when 'n'
      parent_permission = false
    when 'y'
      parent_permission = true
    else
      puts 'Out of range!'
    end
    @people << Student.new(nil, age, name, parent_permission: parent_permission)
    puts 'you have successfully registered a student!'
  end

  def create_teacher
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i
    print 'Specialization:'
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
    puts 'you have successfully registered a teacher!'
  end

  # add a book
  def add_book
    print 'Author:'
    author = gets.chomp
    print 'title:'
    title = gets.chomp
    @books << Book.new(title, author)
    puts 'you have successfully added a new book!'
  end

  # create rental
  def add_rental
    return puts 'No book to rent!' if @books.empty?
    return puts 'No person found to rent a book!' if @people.empty?

    puts "Choose a Book:\n\n"
    @books.each_with_index { |book, index| puts "Book- #{index}\nTitle: #{book.title}\nAuthor: #{book.author}\n\n" }

    book_number = gets.chomp.to_i
    return puts 'Invalid book number!' if book_number >= @books.length

    puts "Choose a Person:\n\n"
    @people.each_with_index do |person, index|
      puts "Person- #{index}\nName: #{person.name}\nAge: #{person.age}\nID: #{person.gets_id}\n\n"
    end

    person_number = gets.chomp.to_i
    return puts 'Invalid person number!' if person_number >= @people.length

    rental = Rental.new(Date.today, @books[book_number], @people[person_number])
    @people[person_number].rent_book(rental)
    @books[book_number].add_rentals(rental)
    puts 'Rental created'
  end

  # rental by ID
  def retal_by_id
    puts 'Insert ID: '
    id = gets.chomp.to_i
    if @people.empty?
      puts 'list is empty'
    else
      person = @people.find { |pers| pers.gets_id == id }
      puts 'Rentals'
      if person.rentals.empty?
        puts 'The person you entered did not rent any book'
      else
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
  end
end

require_relative 'app'
# require_relative 'book'

def display_menu
  puts <<~MENU
    Welcome to the Library App!
    Please choose an option:
    1. List all books
    2. List all people
    3. Create a person
    4. Create a book
    5. Create a rental
    6. List all rentals for a given person id
    7. Quit
  MENU
end

def handle_choice(choice, app)
  case choice
  when 1 then app.display_books
  when 2 then app.display_people
  when 3 then app.add_person
  when 4 then app.add_book
  when 5 then app.add_rental
  when 6 then app.retal_by_id
  when 7 then return false
  else puts "Invalid number\n"
  end
  true
end

def main
  app = App.new

  loop do
    display_menu
    choice = gets.chomp.to_i
    break unless handle_choice(choice, app)
  end
end
main

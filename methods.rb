class Methods
  def initialize
    @person_array = []
    @books = []
    @rental_array = []
  end

  def create_person
    puts ' Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_option = gets.chomp.to_i

    case person_option
    when 1
      print 'Age: '
      user_age = gets.chomp.to_i

      print 'Name: '
      user_name = gets.chomp

      print 'Has parent permission? [Y/N]: '
      user_permission = gets.chomp.to_s.upcase

      case user_permission
      when 'Y'
        user_permission = true
      when 'N'
        user_permission = false
      end
      student = Student.new(user_age, user_name, parent_permission: user_permission)
      @person_array << {
        output: "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}",
        object: student
      }

      puts 'Person created successfully!'
      puts "\n"
    when 2
      print 'Age: '
      user_age = gets.chomp.to_i

      print 'Name: '
      user_name = gets.chomp

      print 'Specialization: '
      user_specialization = gets.chomp

      teacher = Teacher.new(user_age, user_name, user_specialization)
      @person_array << {
        output: "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}",
        object: teacher
      }

      puts 'Person created successfully!'
      puts "\n"
    else
      puts 'Person not created.'
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp

    print 'Author: '
    book_author = gets.chomp

    puts 'Book created successfully!'

    book = Book.new(book_title, book_author)

    @books << { output: "Title: #{book.title}, Author: #{book.author}", object: book }
  end

  def book_list
    @books.each { |book| puts book[:output] }
  end

  def people_list
    @person_array.each { |person| puts person[:output] }
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index { |val, index| puts "(#{index}) #{val[:output]}" }
    book_chosen = gets.chomp.to_i
    if @books.empty?
      puts 'Empty'
      return
    end

    puts 'Select a person from the following list by number (not id): '
    @person_array.each_with_index do |person, index|
      puts "#{index}) #{person[:output]}"
    end
    person_selected = gets.chomp.to_i
    person_chosen = @person_array[person_selected][:object]

    if @person_array.empty?
      puts 'Empty'
      return
    end

    print 'Date: '
    rental_date = gets.chomp

    @rental_array << Rental.new(rental_date, book_chosen, person_chosen)
  end

  def rental_list
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rental: '
    @rental_array.each do |rental|
      if person_id == rental.person.id
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      else
        puts 'ID does not exist'
      end
    end
  end
end

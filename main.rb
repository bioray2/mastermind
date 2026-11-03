require_relative "./lib/board.rb"
@user_sequence = []
@count = 0
computer_sequence = Board.new(@user_sequence, @count)

# pre loop logic handling original instructions and computer sequence generation
puts "Enter 4 of the following colors: Green, Blue, Red, Orange, Yellow, Purple\nEx (orange, orange, orange, green)"
computer_sequence.generate_sequence

# 12 round loop that holds all of the game logic
12.times do |count|
  @count = count

  # displays which round it is
  puts "------#{count}------"

  # gets the user input and puts it inside an array
  gets.chomp.split(', ').each do |colour|
    @user_sequence << colour
  end

  # compares the user input and computer sequence and ends if they match
  computer_sequence.compare
   if computer_sequence.outcome
     break
   end
end
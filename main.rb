require_relative "./lib/board.rb"
@user_sequence = []
@count = 0
computer_sequence = Board.new(@user_sequence, @count)

puts "Enter 4 of the following colors: Green, Blue, Red, Orange, Yellow, Purple\nEx (orange, orange, orange, green)"
computer_sequence.generate_sequence
12.times do |count|
  @count = count
  puts "------#{count}------"
  gets.chomp.split(', ').each do |colour|
    @user_sequence << colour
  end
  computer_sequence.compare
   if computer_sequence.outcome
     break
   end
end
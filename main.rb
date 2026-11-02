require_relative "./lib/board.rb"
@user_sequence = []
computer_sequence = Board.new(@user_sequence)

puts "Enter the 4 of the following colors: Green, Blue, Red, Orange, Yellow, Purple\n Ex (orange, orange, orange, green)"
12.times do |count|
  puts "------#{count}------"
  computer_sequence.generate_sequence
  @user_sequence << gets.chomp.split(', ')
  computer_sequence.compare
end
class Board
  def initialize(array, count)
      @count = count
      @user_sequence = array
      @computer_sequence = []
      @return = []
  end

  # generates a random 4 number color sequence using rand and case 
  def generate_sequence
    until @computer_sequence.length >= 4 do
      case rand(1..6)
      when 1
        @computer_sequence << "green"
      when 2
        @computer_sequence << "yellow"
      when 3
        @computer_sequence << "red"
      when 4
        @computer_sequence << "blue"
      when 5
        @computer_sequence << "purple"
      when 6
        @computer_sequence << "orange"
      end
    end
  end

  # returns an array of good or wrong after comparing user input and the computers random sequence
  def compare
    @return.clear
    @dupe_sequence = @computer_sequence.dup
    puts @computer_sequence.join(' ')
    4.times do |count|
      if @computer_sequence[count] == @user_sequence[count]
        @return << '[Good]'
        # confusing but, finds the first occurance of the color being compared in user_sequence in dupe_sequence
        @dupe_sequence.delete_at(@dupe_sequence.find_index(@user_sequence[count]))
      else
        @return << '[Wrong]'
      end
    end
    clean
    @user_sequence.clear
    puts @return.join(' ')
  end

  # checks for win or lose
  def outcome
    if @return.all? {|color| color == '[Good]'}
      puts "You Win!"
      reset
      return true
    elsif @count >= 12
      puts "You Lose!" 
      reset
      return false
    end
    false
  end

  # does a second sweep of the return array, and adds close
  def clean
    4.times do |count|
      if @dupe_sequence.include? @user_sequence[count]
        # confusing but, finds the first occurance of the color being compared in user_sequence in dupe_sequence
        @dupe_sequence.delete_at(@dupe_sequence.find_index(@user_sequence[count]))
        @return[count] = '[Close]'
      end
    end
  end

  # resets all of the arrays and counters
  def reset
    @user_sequence.clear
    @return.clear
    @computer_sequence.clear
    @count = 0
    @dupe_sequence.clear
  end
end
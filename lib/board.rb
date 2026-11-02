class Board
  def initialize(array)
      @user_sequence = array
      @computer_sequence = []
      @return = []
  end

  def generate_sequence
    until @computer_sequence.length >= 4 do
      case rand(1...6)
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

  def compare
    i = 0
    4.times do |count|
      if @computer_sequence[i] == @user_sequence[i]
        @return << '[Good]'
      elsif @computer_sequence.include? @user_sequence[i]
        @return << '[Close]'
      else
        @return << '[Wrong]'
      end
      i += 1
    end
    puts @return.join(' ')
  end
end
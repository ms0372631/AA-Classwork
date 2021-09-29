class Hangman

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end
  
  def get_matching_indices(char)
    res = []
    @secret_word.each_char.with_index do |a, i|
      res << i if a == char
    end
    res
  end

  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i] = char
    end
  end

  
  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attemped"
      return false
    else
      @attempted_chars << char
      if !@secret_word.include?(char)
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, self.get_matching_indices(char))
      end
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    ans = gets.chomp
    self.try_guess(ans)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      p "#{@secret_word}"
      return true
    else
      false
    end
  end

end

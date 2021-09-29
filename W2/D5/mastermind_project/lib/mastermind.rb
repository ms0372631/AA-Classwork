require_relative "code"

class Mastermind
    def initialize(num)
        @secret_code = Code.random(num)
    end

  def print_matches(code)
    puts "#{code.num_exact_matches(@secret_code)}"
    puts "#{code.num_near_matches(@secret_code)}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    guess_code = Code.from_string(gets.chomp)
    puts "#{guess_code.num_exact_matches(@secret_code)}"
    puts "#{guess_code.num_near_matches(@secret_code)}"
    guess_code == @secret_code
  end
end

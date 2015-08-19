require 'pry'
class Game
  attr_accessor :cheats, :last_guess, :something
  def initialize(limit=100)
    @limit = limit
    @number = rand(limit)
    @last_guess = nil
    @cheats = false
    @guesses = 0
    @guesslimit = 5
  end

  def guess(guess_num)
    if @guesses >= @guesslimit
      reset_game
    elsif guess_num
      @last_guess = guess_num.to_i
      @guesses += 1
    else
      @last_guess = nil
    end
  end

  def reset_game
    @guesses = 0
    @number = rand(@limit)
    @last_guess = nil
  end


  def last
    output = ""
    if @last_guess
      output += "You last guess was #{@last_guess}, "
      output += too
    end
    output
  end

  def message
       "#{cheat}
       #{last}
       #{guess_message}"
  end

  def guess_message
    output = "you have #{@guesslimit - @guesses} left. "
    if @guesslimit == @guesses
      output +=  "reseting game."
      reset_game
    elsif @last_guess == @number
      output += "reseting game."
      reset_game
    end
    output
  end

  def too
    if @last_guess > @number + 5
      way_too_high
    elsif @last_guess > @number
      too_high
    elsif @last_guess < @number - 5
      way_too_low
    elsif @last_guess < @number
      too_low
    else
      got_it
    end
  end

  def cheat
    if @cheats
    "the number is #{@number} \n"
    end
  end

  def way_too_high
   "<span style='color: red;'>Way too HIGH</span>"
  end

  def way_too_low
   "<span style='color: red;'>Way too LOW</span>"
  end

  def too_low
   "<span style='color: #FFCC00;'>too LOW</span>"
  end

  def too_high
   "<span style='color: #FFCC00;'>too HIGH</span>"
  end

  def got_it
   "<span style='color: green;'>You GOT IT!</span>"
  end

end


__END__
ok message should be something like

number is x
your last guess was 34
way too high way too low to high too low
you have x guesses left

or

the number is x
you last guess was 34.
way too high way too low
that was your last guess reseting game

or

the number is x
you last guess was 34
you got it! reseting game with new number

every time the driver code should look like

game.guess(params[guess])
index.erb (game.message)
so the message has to be formable upon guess
guess should
set last_guess
increment guess_count



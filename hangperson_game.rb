class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service
  attr_accessor:word
  attr_accessor:guesses
  attr_accessor:wrong_guesses
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
 def guess(letter)
    if letter == nil || !(letter.class == String && letter =~ /^[A-z]$/i)
      raise ArgumentError
    end
    
    letter.downcase!
    
    if @guesses.include?(letter) || @wrong_guesses.include?(letter)
      return false
    end
    
    return false if letter.length != 1
    
    if @word.include? letter
      @guesses += letter
    else
      @wrong_guesses += letter
    end
    return true
  end
  
    def word_with_guesses
    result = ''
    @word.split('').each do |char|
      if @guesses.include? char
        result << char
      else
        result << '-'
      end
    end
    
    return result
  end
  
  def check_win_or_lose
    if word_with_guesses.downcase == @word.downcase
      return "win"
    elsif @wrong_guesses.length >= 7
      return "lose"
    else
      return "play"
    end
  end
  

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end

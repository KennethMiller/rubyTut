require './wordlist'
require './picture'
require 'colorize'

class Game
  def initialize()
    @wordlist = Wordlist.new('./words.txt')
    @word = ''
    @alpha = 'a'..'z'
    @guesses = 5
    @picture = Picture.new()
    @messages = nil
    @letters = nil
    @over = nil
    @win = nil
  end

  def start
    teardown
    mainloop
    puts @win ? "You win!" : "You lose! #{@word}"
  end
  
private

  def clear_screen
    print "\e[H\e[2J"
  end

  def teardown
    # handle clearing state and whatnot between rounds
    @letters = init_letters
    @over = false
    @win = false
    @guesses = 5
    @messages = []
    @word = @wordlist.get_word
  end

  def already_guessed letter
    return "#{letter} has already been guessed!"
  end

  def already_guessed? letter
    return false || @letters[letter]
  end

  def mark_letter letter
    @letters[letter] = true
  end

  def win?
    win = true
    return @win if @win
    @word.each_char do |lett|
      win = false if !@letters[lett.downcase]
    end
    return win
  end

  def check_letter letter
    return false if letter == nil || letter.size > 1
    return @word.downcase.include? letter
  end

  def check_guess
    @win = true and return if @guess == @word.downcase
    letter = nil
    letter = @guess if @guess.size == 1 # single letter
    @messages.push(already_guessed letter) and return if already_guessed? letter
    mark_letter letter unless letter == nil
    @guesses -= 1 unless check_letter letter 
  end

  def display_string
    str = ""
    @word.each_char do |lett|
      str += already_guessed?(lett.downcase) ? lett : "_"
    end
    puts str 
  end

  def display_message
    @messages.size.times do 
      message = @messages.shift
      puts message
    end
  end

  def display_hangman
    puts @picture.winning if @win
    puts @picture.image @guesses unless @win
  end

  def show_letters
    @letters.each do |letter,used|
      if used
        print letter.red + ' '
      else
        print letter.green + ' '
      end
    end
  end


  def mainloop
    # core game logic goes here
    loop do 
      clear_screen
      display_message
      show_letters
      @over = true if @guesses == 0
      @win = win?
      display_hangman
      break if @win || @over
      display_string
      @guess = gets.chomp.downcase
      check_guess
    end
  end

  def init_letters
    # create a new hash with each letter set to false
    temp = {}
    @alpha.each do |letter|
      temp[letter] = false
    end
    return temp
  end

end
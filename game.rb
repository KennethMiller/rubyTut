require './wordlist'
require './picture'
require 'colorize'

class Game
  def initialize()
   # create instance variables for the game
  end

  def start
    # setup and start the game
  end
  
private

  def clear_screen
    # clear an ansi screen
    print "\e[H\e[2J"
  end

  def setup
    # handle setting initial state and whatnot between rounds
  end

  def display_string
    # this function should display the word to guess with letters
    # and underscores
  end

  def display_message
    # show a message to the user
  end

  def display_hangman
   # display our hangman picture
  end

  def show_letters
    # show letters that are available to the user
  end

  def mainloop
    loop do 
      # core game logic goes here
    end
  end

  def init_letters
    # create a new hash with each letter set to false
  end

end
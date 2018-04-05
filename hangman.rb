require './game'

hangman = Game.new

def prompt
  puts 'Would you like to play again? Y/n'
  answer = gets.chomp
  return answer =~ /[y|Y]+.*/
end

loop do
  hangman.start
  ans = prompt
  break unless ans
end
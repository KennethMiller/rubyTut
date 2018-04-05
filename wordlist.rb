class Wordlist 
  def initialize(filePath, difficulty=1)
    @filePath = filePath
    @difficulty = difficulty
    @words = []
  end

  def get_word
    init_words if @words.empty?
    return @words.pop
  end

private
  def init_words
    @words = File.read(@filePath).split("\n").shuffle
    case @difficulty
    when 1
      wordsize = 5
    when 2
      wordsize = 7
    when 3
      wordsize = 12
    when 4
      wordsize = 15
    when 5
      wordsize = 20
    else
      wordsize = 4
    end
    @words = @words.find_all do |word|
      word.size <= wordsize
    end
  end
  
  
end
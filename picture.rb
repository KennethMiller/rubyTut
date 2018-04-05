class Picture
  def initialize()
    @pictures = File.read('./pictures.txt').split(',')
  end
  
  def winning
    return @pictures[6]
  end

  def image num
    return @pictures[num]
  end
  
end
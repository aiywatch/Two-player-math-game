class Player
  attr_reader :name, :life, :score

  def initialize (name)
    @name = name
    @life = 3
    @score = 0
  end

  def update_socre (right)
    right ? @score += 1 : @life -= 1
  end

  def restart_life
    @life = 3
  end
end
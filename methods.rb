p "test methods"


MAX_NUMBER = 10


def get_name
  
  # (1..2).each do |i|
  #   puts "Please enter Player #{i} name ? "
  #   name = gets.strip
  #   $players[i - 1][:name] = name unless name.empty?
  # end

  $players.each_with_index do |player, i|
    puts "Please enter Player #{i+1} name ? "
    name = gets.strip
    player[:name] = name unless name.empty?
  end
end

def question(opt = "")
  q = "What does X1 OP X2 equal?"
  ans = 0
  opt.to_i
  opt = rand(3) if opt == ""
  operand_1 = rand(MAX_NUMBER)
  operand_2 = rand(MAX_NUMBER)

  case opt
  when 0
    q.gsub!(/X1 OP X2/, "#{operand_1} plus #{operand_2}")
    ans = operand_1 + operand_2
  when 1
    q.gsub!(/X1 OP X2/, "#{operand_1} substract_by #{operand_2}")
    ans = operand_1 - operand_2
  when 2
    q.gsub!(/X1 OP X2/, "#{operand_1} multiplied by #{operand_2}")
    ans = operand_1 * operand_2
  end

  puts q
  ans
end

def game_end?
  game_stop = true
  # $players[0][:live] == 0 || $players[1][:live] == 0

  if $players[0][:live] == 0 && $players[1][:live] == 0
    puts "Game draw !".colorize(:color => :light_blue, :background => :red)
  elsif $players[0][:live] == 0
    puts "#{$players[1][:name]} won the game".colorize(:color => :light_blue, :background => :red)
  elsif $players[1][:live] == 0
    puts "#{$players[0][:name]} won the game".colorize(:color => :light_blue, :background => :red)
  else
    game_stop = false
  end

  game_stop
end

# should return true if answer is correct, and return false if not
def check_ans (ans, ans_user, player)
  if ans == ans_user.to_i
    puts "Right !".green
    puts "Your life is #{ player[:live] }".green
  else
    puts "Wrong !".red
    player[:live] -= 1
    puts "Your life is #{ player[:live] }".red
  end
end

def really_end?
  puts "Do you want to restart the game ? (yes, no)"
  # command = gets.strip
  gets.strip == 'yes' ? false : true
end




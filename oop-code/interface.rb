require 'colorize'

def welcome
  puts "=================== Welcome to Math Game ===================".light_blue
  print " How many players ? ".magenta
end

def get_name (i)
  print "What is the player #{ i+1 } name (default : Player #{ i+1 }) :: ".cyan
end

def show_get_operator 
  print "What operation do you want ? (random, add, subtract, multiply) :: ".cyan
end

def get_start
  puts "============== GAME STARTED ==============".light_green.on_light_blue
end

def show_question (question)

  q = "====>>>> What does X1 OP X2 equal ?"
  case question.opt
  when 'add'
    q.gsub!(/X1 OP X2/, "#{question.operand_1} plus #{question.operand_2}")
  when 'subtract'
    q.gsub!(/X1 OP X2/, "#{question.operand_1} minus #{question.operand_2}")
  when 'multiply'
    q.gsub!(/X1 OP X2/, "#{question.operand_1} multiplied by #{question.operand_2}")
  end

  puts q.blue
end

def show_ans(right)
  if right
    puts "+++++++ Right +++++++".green
  else
    puts "------- Wrong -------".red
  end
end

def show_player_score (player)
  puts "#{player.name}'s score is #{player.score} and remainning life is #{player.life}".white.on_light_blue
end

def show_record (players)
  puts ">>>>>>>>>>>> Record <<<<<<<<<<<<".white.on_red
  players.each do | player |
    puts "#{player.name}'s score is #{player.score}".white.on_red
  end
end

def show_restart
  puts "Do you want to restart the game ? ('yes' to restart)".green
end

def show_end_game
  puts "==== The game end! support us at Account: 123-5436-744 TD ====".white.on_magenta
end
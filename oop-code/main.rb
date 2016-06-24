require_relative 'interface'
require_relative 'player'
require_relative 'question'

def name?(i)
  name = gets.strip
  name.empty? ? "Player #{i+1}" : name
end

def check_ans(question, user_ans)
  right = question.ans == user_ans
  show_ans(right)
  right
end

def create_users
  number_players = gets.strip.to_i
  players = []

  number_players.times do |i|
    get_name(i)
    players << Player.new(name?(i))
  end
  players
end

def game_end?
  return true if @players.empty?
  @players.each { |player| return true if player.life == 0 }
  false
end

def restart?
  show_restart()
  if gets.strip == 'yes'
    @players.each { |player| player.restart_life }
    return true
  end
  false
end


welcome()
@players = create_users()

begin
  show_get_operator()
  operator = gets.strip.downcase
  get_start()

  while !game_end?()

    @players.each do | player |
      question = Question.new(operator)
      show_question(question)
      user_ans = gets.strip.to_i
      right = check_ans(question, user_ans)
      player.update_socre(right)
      show_player_score(player)
    end

  end

  show_record (@players)
end while restart?()


show_end_game()

require 'colorize'
require_relative './methods'

$players = [{ name: "Player 1", live: 3}, { name: "Player 2", live: 3}]
$record = []



####### Main #######

puts "=================== Welcome to Math Game ===================".light_blue

get_name

begin

  $players = [{ name: "Player 1", live: 3}, { name: "Player 2", live: 3}]

  puts "===================== Game started!! =====================".light_blue


  while !game_end?
    $players.each_with_index do | player, i |
      print "Player #{i + 1}: "
      ans = question()
      ans_user = gets.strip
      check_ans(ans, ans_user, player)
    end
  end

  puts "The record of all the games are"
  $record << "#{$players[0][:name]} got #{$players[0][:live]} and #{$players[1][:name]} got #{$players[1][:live]} "
  puts $record
end until really_end?

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  winner = nil
  strategy = 1
  player1 = 0
  player2 = 1

  strategy1 = game[player1][strategy].upcase
  strategy2 = game[player2][strategy].upcase

  #prs
  if (strategy1 =~ /[RPS]/) and (strategy2 =~ /[RPS]/)
    if strategy1 == strategy2
      winner = game[player1]
    else
      if (strategy1 == "P") and (strategy2 == "S")
        winner = game[player2]
      elsif (strategy1 == "S") and (strategy2 == "P")
        winner = game[player1]
      elsif strategy1 < strategy2
        winner = game[player1]
      elsif strategy1 > strategy2
        winner = game[player2]
      end
    end
  else
    raise NoSuchStrategyError
  end
  return winner
end

=begin
p rps_game_winner([["Armando", "P"], ["Dave", "S"]])
#rps_game_winner([["Armando", "P"], ["Dave", "S"],["Armando", "P"]])
p rps_game_winner([["Armando", "S"], ["Dave", "P"]])
p rps_game_winner([["Armando", "P"], ["Dave", "R"]])
#rps_game_winner([["Armando", "Y"], ["Dave", "S"]])
p rps_game_winner([["Armando", "S"], ["Dave", "S"]])
p rps_game_winner([["Armando", "R"], ["Dave", "S"]])
p rps_game_winner([["Armando", "S"], ["Dave", "R"]])
=end


def rps_tournament_winner(game)
  if game[0][0] =~ /[a-zA-Z]/
    return rps_game_winner(game)
  else
    rps_game_winner([rps_tournament_winner(game[0]), rps_tournament_winner(game[1])])
  end
end

=begin
gamer = [
         [
         [
          [["Armando", "P"], ["Dave", "S"]],
          [["Richard", "R"], ["Michael", "S"]]
         ],
         [
          [["Allen", "S"], ["Omer", "P"]],
          [["David E.", "R"], ["Richard X.", "P"]]
         ]],
        [
         [
          [["Armando", "R"], ["Dave", "S"]],
          [["Richard", "R"], ["Michael", "P"]]
         ],
         [
          [["Allen", "S"], ["Omer", "P"]],
          [["David E.", "R"], ["Richard X.", "S"]]
         ]
          ]
        ]
p rps_tournament_winner(gamer)
=end

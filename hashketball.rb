require "pry"

def game_hash
  {
    :home => { :team_name => "Brooklyn Nets",
              :colors => ["Black", "White"],
              :players => [
                  {:player_name => "Alan Anderson",
                   :number => 0,
                   :shoe => 16,
                   :points => 22,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 1},
                  {:player_name => "Reggie Evans",
                   :number => 30,
                   :shoe => 14,
                   :points => 12,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 12,
                   :blocks => 12,
                   :slam_dunks => 7},
                  {:player_name => "Brook Lopez",
                   :number => 11,
                   :shoe => 17,
                   :points => 17,
                   :rebounds => 19,
                   :assists => 10,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 15},
                  {:player_name => "Mason Plumlee",
                   :number => 1,
                   :shoe => 19,
                   :points => 26,
                   :rebounds => 11,
                   :assists => 6,
                   :steals => 3,
                   :blocks => 8,
                   :slam_dunks => 5},
                  {:player_name => "Jason Terry",
                   :number => 31,
                   :shoe => 15,
                   :points => 19,
                   :rebounds => 2,
                   :assists => 2,
                   :steals => 4,
                   :blocks => 11,
                   :slam_dunks => 1}
                ]
              },
     :away => { :team_name => "Charlotte Hornets",
                :colors => ["Turquoise", "Purple"],
                :players => [
                   {:player_name => "Jeff Adrien",
                   :number => 4,
                   :shoe => 18,
                   :points => 10,
                   :rebounds => 1,
                   :assists => 1,
                   :steals => 2,
                   :blocks => 7,
                   :slam_dunks => 2},
                  {:player_name => "Bismack Biyombo",
                   :number => 0,
                   :shoe => 16,
                   :points => 12,
                   :rebounds => 4,
                   :assists => 7,
                   :steals => 22,
                   :blocks => 15,
                   :slam_dunks => 10},
                  {:player_name => "DeSagna Diop",
                   :number => 2,
                   :shoe => 14,
                   :points => 24,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 4,
                   :blocks => 5,
                   :slam_dunks => 5},
                  {:player_name => "Ben Gordon",
                   :number => 8,
                   :shoe => 15,
                   :points => 33,
                   :rebounds => 3,
                   :assists => 2,
                   :steals => 1,
                   :blocks => 1,
                   :slam_dunks => 0},
                  {:player_name => "Kemba Walker",
                   :number => 33,
                   :shoe => 15,
                   :points => 6,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 7,
                   :blocks => 5,
                   :slam_dunks => 12}
                  ]
                }
  }
end

def player(name)
  game_hash.each do |team, data|
    data[:players].each do |him|
      if him[:player_name] == name
        return him
      end
    end
  end
end

def num_points_scored(name)
  player(name)[:points]
end

def shoe_size(name)
  player(name)[:shoe]
end

def team_colors(team_name)
  game_hash.each do |team, data|
    if data[:team_name] == team_name
      return data[:colors]
    end
  end
end

def team_names
  game_hash.map do |team, data|
    data[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.each do |team, data|
    if data[:team_name] == team_name
      return data[:players].collect do |player|
        player[:number]
      end
    end
  end
end

## def player_stats(name)
##   temp = player(name).dup
##   temp.delete(:player_name)
##   temp
## end

def player_stats(name)
	new_hash = {}
	game_hash.collect do |place, team|
		team.each do |attribute, data|
			if attribute == :players 
				game_hash[place][attribute].each do |player|
					if player[:player_name] == name
						new_hash = player.delete_if do |k, v|
							k == :player_name
						end
					end
				end
			end
		end
	end
	new_hash
end


def big_shoe_rebounds
  rebounds = 0
  biggest_shoe = 0
  game_hash.each do |team, data|
    data[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end


########BONUS

def most_points_scored
  most_point = 0
  player_name = 0
  game_hash.each do |team, data|
    data[:players].each do |player|
      if player[:points] > most_point
        most_point = player[:points]
        player_name = player[:player_name]
      end
    end
  end
  player_name
end





def iterate_through_players_for(name, statistic)
  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      return player[statistic] if player[:player_name] == name
    end
  end
end

def winning_team
  scores = {"Brooklyn Nets" => 0, "Charlotte Hornets" => 0}
  game_hash.each do |team, game_data|
    game_data[:players].each do |player|
      scores[game_data[:team_name]] += iterate_through_players_for(player[:player_name], :points)
    end
  end
  scores.max_by { |k,v| v }.first
end

##  def winning_team
##    points_total_home = 0
##    points_total_away = 0
##    game_hash[:home][:players].each do |player|
##        points_total_home = points_total_home + player[:points]
##      end
##    game_hash[:away][:players].each do |player|
##        points_total_away = points_total_away + player[:points]
##      end
##    if points_total_home > points_total_away
##      game_hash[:home][:team_name]
##    else game_hash[:away][:team_name]
##    end
##  end





def player_with_longest_name
  name_count = 0
  player_name = 0
  game_hash.each do |team, data|
    data[:players].each do |player|
      if player[:player_name].length > name_count
        name_count = player[:player_name].length
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  steals_count = 0
  player_name = 0
  game_hash.each do |team, data|
    data[:players].each do |player|
      if player[:steals] > steals_count
        steals_count = player[:steals]
        player_name = player[:player_name]
      end
    end
  end
  if player_name == player_with_longest_name
    return true 
  else
  return false
  end
end
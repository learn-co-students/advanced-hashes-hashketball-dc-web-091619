# Write your code here!
def game_hash()
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:name => "Alan Anderson", :number => 0, 
        :shoe => 16, :points => 22, :rebounds => 12,
        :assists => 12,:steals => 3, :blocks => 1, 
        :slam_dunks => 1},
        {:name => "Reggie Evans", :number => 30, 
        :shoe => 14, :points => 12, :rebounds => 12,
        :assists => 12,:steals => 12, :blocks => 12,
        :slam_dunks => 7},
        {:name => "Brook Lopez", :number => 11, 
        :shoe => 17, :points => 17, :rebounds => 19,
        :assists => 10,:steals => 3, :blocks => 1, 
        :slam_dunks => 15},
        {:name => "Mason Plumlee", :number => 1, 
        :shoe => 19, :points => 26, :rebounds => 11,
        :assists => 6,:steals => 3, :blocks => 8, 
        :slam_dunks => 5},
        {:name => "Jason Terry",:number => 31, 
        :shoe => 15, :points => 19, :rebounds => 2,
        :assists => 2,:steals => 4, :blocks => 11, 
        :slam_dunks => 1}
      ]
    },
    :away =>{
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:name => "Jeff Adrien",:number => 4, 
        :shoe => 18, :points => 10, :rebounds => 1,
        :assists => 1,:steals => 2, :blocks => 7, 
        :slam_dunks => 2},
        {:name => "Bismack Biyombo",:number => 0, 
        :shoe => 16, :points => 12, :rebounds => 4,
        :assists => 7,:steals => 22, :blocks => 15, 
        :slam_dunks => 10},
        {:name => "DeSagna Diop",:number => 2, 
        :shoe => 14, :points => 24, :rebounds => 12,
        :assists => 12,:steals => 4, :blocks => 5, 
        :slam_dunks => 5},
        {:name => "Ben Gordon",:number => 8, 
        :shoe => 15, :points => 33, :rebounds => 3,
        :assists => 2,:steals => 1, :blocks => 1, 
        :slam_dunks => 0},
        {:name => "Kemba Walker",:number => 33, 
        :shoe => 15, :points => 6, :rebounds => 12,
        :assists => 12,:steals => 7, :blocks => 5, 
        :slam_dunks => 12}
      ]
    }
  }
end

def num_points_scored(name)
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    team_players.each do |values|
        values.each do |category, statistic|
            if statistic == name
                return values[:points]
            end
        end
    end
end


def shoe_size(name)
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    team_players.each do |values|
        values.each do |category, statistic|
            if statistic == name
                return values[:shoe]
            end
        end
    end
end

def team_colors(team)
  if team == "Charlotte Hornets"
    game_hash[:away][:colors]
  elsif team == "Brooklyn Nets"
    game_hash[:home][:colors]
  else

  end
end

def team_names
array2 = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :team_name
                array2.push(values)

            end
          end
  end
  return array2
end


def player_numbers(team_name)
game_hash.each do | location, team_data |
    if team_data[:team_name] == team_name
      return team_data[:players].map do | player | player[:number]
        end
      end
    end
end


def player_stats(player_name)
game_hash.each do | location, team_data |
  team_data[:players].each do | player |
  if player[:name] == player_name
    return player_stats
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0

  game_hash.each do | location, team_data |
    team_data[:players].each do | stats |
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def num_points_scored2(player_name)
  game_hash.each do |location, team_data|
  if team_data[:players].include?(player_name)
    return team_data[:players][player_name][:points]
    end 
  end
  nil
end 


def find_player_hash(player_name)
  game_hash.each do |location, team_data|
    if team_data[:players].include?(player_name)
      return team_data[:players][player_name]
    end 
  end
end 


def num_points_scored3(player_name)
  find_player_hash(player_name)[:points]
end 

def shoe_size_2(player_name)
  find_player_hash(player_name)[:shoe]
end 

def player_stats(name)
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if name==player_info[:name]
        return player_info.reject{|key,value|key==:name}
      end
    end
  end
end

def most_points_scored
  most_points = 0
  top_player = ' '

  game_hash.each do | location, team_data |
    team_data[:players].each do | player |
      points = player[:points]
      if points > most_points
        most_points = points
        top_player = player[:name]
      end
    end
  end
  top_player
end

def winning_team
    home_score = 0
    away_score = 0
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    home.each do |player|
        home_score += player[:points]
    end
    away.each do |player|
        away_score += player[:points]
    end
    if home_score > away_score
        game_hash[:home][:team_name]
    else
        game_hash[:away][:team_name]
    end
end

def player_with_longest_name
  longest = ' '
  longest_length = 0
  game_hash.each do | location, team_data |
    team_data[:players].each do | player |
      name_length = player[:name].length
      longest, longest_length = player[:name], name_length if name_length > longest_length
    end
  end
  return longest
end

def long_name_steals_a_ton?

most_steals = 0
player_most_steals = ' '

game_hash.each do | location, team_data |
  team_data[:players].each do | player |
player_most_steals, most_steals = player[:name], player[:steals] if player[:steals] > most_steals
end
end
return  true if player_most_steals == player_with_longest_name
end
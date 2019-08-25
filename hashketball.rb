# Write your code here!
require "pry"

def game_hash
  game = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" =>{
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15        
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5     
      },
      "Jason Terry" =>{
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  }, 
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      }, 
      "Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }}
  return game
end

def num_points_scored(player_name)
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player, player_data|
      if player == player_name
        return player_data[:points]
      elsif player =! player_name
        return nil  
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player, player_data|
      if player == player_name
        return player_data[:shoe]
      elsif player =! player_name
        return nil  
      end
    end
  end
end

def team_colors team 
 game_hash.each do |team_position, team_data|
   if team == team_data[:team_name]
     return team_data[:colors]
   end
 end
end

def team_names
  team_array = []
  team_array << game_hash[:home][:team_name]
  team_array << game_hash[:away][:team_name]
  return team_array
end

def player_numbers(name)
  player_number_array = []
  game_hash.each do |team_position, team_data|
    if team_data[:team_name] == name
      team_data[:players].each do |player, player_data|
        player_number_array << player_data[:number] 
      end
    end
  end
  player_number_array
end

def player_stats(name)
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
        return player_stats
      end
    end
  end
end

#shoe size looking for is 19
def big_shoe_rebounds 
  biggestshoe = 0
  player_biggest_shoe = 0
  
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_stats[:shoe] > biggestshoe
        biggestshoe = player_stats[:shoe]
        player_biggest_shoe = player_stats[:rebounds]
      end
    end
  end

  biggestshoe #test to see if the shoe size is 19
  player_biggest_shoe #returns the solution
end

def most_points_scored
  most_points = 0 
  player = ""
  
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player_name, player_stats|
      if most_points < player_stats[:points]
        player = player_name
        most_points = player_stats[:points]
      else
        most_points
      end
    end
  end
  
  player
end

def winning_team
  home = 0 
  away = 0 
  
  game_hash.each do |team_position, team_data|
    if team_position = :home
      team_data[:players].each do |player_name, player_stats|
        home = home + player_stats[:points]
      end
    end
  end
  
  game_hash.each do |team_position, team_data|
    if team_position = :away
      team_data[:players].each do |player_name, player_stats|
        away = away + player_stats[:points]
      end
    end
  end

  if away > home
    return game_hash[:away][:team_name]
  elsif home > away 
    return game_hash[:home][:team_name]
  else "They tied!"
  end

  return "Brooklyn Nets"
end

def player_with_longest_name
  longest_name_length = 0
  playerName = ""
  
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_name.length > longest_name_length
        longest_name_length = player_name.length
        playerName = player_name
      end
    end
  end
  
  longest_name_length
  playerName 
end

def long_name_steals_a_ton?
  most_steals = 0 
  player_w_most_steals = ""
  
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_stats[:steals] > most_steals
        most_steals = player_stats[:steals]
        player_w_most_steals = player_name
      end
    end
  end
  
  
  if player_with_longest_name == player_w_most_steals
    return true 
  else 
    return false
  end
end
require'pry'
def game_hash
  {:home => {
    :team_name => 'Brooklyn Nets',
    :colors => ['Black', 'White'],
    :players => [
      {:player_name =>  'Alan Anderson', :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
      {:player_name => 'Reggie Evans', :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
      {:player_name => 'Brook Lopez', :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
      {:player_name => 'Mason Plumlee', :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
      
      {:player_name => 'Jason Terry', :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      ]
    },
  :away => {
    :team_name => 'Charlotte Hornets',
    :colors => ['Turquoise', 'Purple'],
    :players => [
      {:player_name =>  'Jeff Adrien', :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
      
      {:player_name => 'Bismack Biyombo', :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
      
      {:player_name => 'DeSagna Diop', :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
      
      {:player_name => 'Ben Gordon', :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
      
      {:player_name => 'Kemba Walker', :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
      ]
    }
  }
end



def num_points_scored(names)
  points = nil
  game_hash.each do |data, attributes|
  attributes.each do |description, values|
attributes[:players].each do |player_hash|
  if names == player_hash[:player_name]
    points = player_hash[:points]
       end
     end
   end
 end
return points
end


def shoe_size(player_name)
  size = nil
  game_hash.each do |data, attributes|
  attributes.each do |playaz, players_name|
attributes[:players].each do |player_hash|
if player_name == player_hash[:player_name]
 size = player_hash[:shoe]
       end
     end
   end
 end
 return size
end


def team_colors(team_name)
  color = nil
  game_hash.each do |data, attributes|
  attributes.each do |description, values|
    if team_name == attributes[:team_name]
      color = attributes[:colors]
      return color
   end
  end
 end
end

def team_names
  names = [] 
  team1 = game_hash[:home][:team_name]
  team2 = game_hash[:away][:team_name]
  names.push(team1)
  names.push(team2)
  return names
end


def player_numbers(team_name)
  team_jerseys = []
  game_hash.each do |data, attributes|
    if team_name == attributes[:team_name]
      attributes[:players].each do |stats|
      team_jerseys.push( stats[:number])
    end
   end
  end
 return team_jerseys
end


def player_stats(player_name)
  game_hash.each do |description, values|
    values[:players].each do |attributes|
      if player_name == attributes[:player_name]
    attributes.delete(:player_name)
     return attributes
      end
    end
  end
end



def big_shoe_rebounds
  rebounds = 0
  count = 0
  game_hash.each do |key, values|
    values[:players].each do | attributes|
    if count < attributes[:shoe]
      count = attributes[:shoe]
       rebounds = attributes[:rebounds]
   end
  end
 end
 return rebounds
end



def most_points_scored
  players_name = ""
  count = 0
   game_hash.each do |key, values|
    values[:players].each do |attributes|
      if count < attributes[:points]
        count = attributes[:points]
        players_name = attributes[:player_name]
    end
   end
  end
return players_name
end



def winning_team
  team1 = 0
  team2 = 0
   game_hash[:home][:players].each do |attributes|
     team1 += attributes[:points]
   end
      game_hash[:away][:players].each do |attributes2|
     team2 += attributes2[:points]
    if team1 > team2
      return game_hash[:home][:team_name]
    else
      return game_hash[:away][:team_name]
    end
  end
end



def player_with_longest_name
  count = 0
  name = ''
  game_hash.each do |key, values|
    values[:players].each do |attributes|
      if count < attributes[:player_name].length
        count = attributes[:player_name].length
        name = attributes[:player_name]
    end
  end
end
return name
end



def long_name_steals_a_ton?
 steals_long_name = 0
  count = 0
  steals = 0 
  name = ''
  game_hash.each do |key, values|
    values[:players].each do |attributes|
      if count < attributes[:player_name].length
        count = attributes[:player_name].length
        name = attributes[:player_name]
        steals_long_name = attributes[:steals]
      end
      if steals < attributes[:steals]
        steals = attributes[:steals]
      end
     end
   end
  if steals == steals_long_name
    return true
  else 
    return false
 end
end





















 






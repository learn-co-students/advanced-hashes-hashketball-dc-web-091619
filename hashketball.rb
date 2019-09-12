def game_hash
  {:home => {
    :team_name => 'Brooklyn Nets',
    :colors => ['black', 'white'],
    :players => [
      {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1, :stats => {:assists=>12, :blocks=>1, :number=>0, :points=>22, :rebounds=>12, :shoe=>16, :slam_dunks=>1, :steals=>3}},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7, :stats => {:assists=>12, :blocks=>12, :number=>30, :points=>12, :rebounds=>12, :shoe=>14, :slam_dunks=>7, :steals=>12}},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15, :stats => {:assists=>10, :blocks=>1, :number=>11, :points=>17, :rebounds=>19, :shoe=>17, :slam_dunks=>15, :steals=>3}},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5, :stats => {:assists=>6, :blocks=>8, :number=>1, :points=>26, :rebounds=>12, :shoe=>19, :slam_dunks=>5, :steals=>3}},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1, :stats => {:assists=>2, :blocks=>11, :number=>31, :points=>19, :rebounds=>2, :shoe=>15, :slam_dunks=>1, :steals=>4}}
      ]
    },
  :away => {
    :team_name => 'Charlotte Hornets',
    :colors => ['turquoise', 'purple'],
    :players => [
      {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2, :stats => {:assists=>1, :blocks=>7, :number=>4, :points=>10, :rebounds=>1, :shoe=>18, :slam_dunks=>2, :steals=>2}},
      {player_name: 'Bismack Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10, :stats => {:assists=>7, :blocks=>15, :number=>0, :points=>12, :rebounds=>4, :shoe=>16, :slam_dunks=>10, :steals=>22}},
      {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5, :stats => {:assists=>12, :blocks=>5, :number=>2, :points=>24, :rebounds=>12, :shoe=>14, :slam_dunks=>5, :steals=>4}},
      {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0, :stats => {:assists=>2, :blocks=>1, :number=>8, :points=>33, :rebounds=>3, :shoe=>15, :slam_dunks=>0, :steals=>1}},
      {player_name: 'Brendan Haywood', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12, :stats => {:assists=>12, :blocks=>5, :number=>33, :points=>6, :rebounds=>12, :shoe=>15, :slam_dunks=>12, :steals=>22}}
      ]
    }
  }
end

def players
  
  players = game_hash.keys.map do |loc|
    
    game_hash[loc][:players]
    
  end
    
    players.flatten    
end

def find_the_player(name)
  
  players.find do |player_hash|
    
    player_hash[:player_name] == name
    
  end
  
end

def num_points_scored(name)

 game_hash.each{|item|
   if item[:players].include? (name)
     return item[:players][:player_name][:points]
   end
 }

end


# # Alternate code
# def num_points_scored(player_n)
#   player_stats(player_n)[:points]
# end


def shoe_size(name)

  found_player = find_the_player(name)
  
  found_player[:shoe]

end


# Alternate code
# def shoe_size(player_n)
#   player_stats(player_n)[:shoe]
# end


def team_colors(team_name)
  game_hash.each do |home_away, keys|
    if keys[:team_name] == team_name
      return keys[:colors].map(&:capitalize)
    end
  end
end


def team_names
  game_hash.map {|home_away, keys| keys[:team_name]}
end


def player_numbers(team_name)
  game_hash.each do |home_away, keys|
    if keys[:team_name] == team_name
      return keys[:players].map { |player| player[:number] }
    end
  end
end

def player_stats(name)

  found_player = find_the_player(name)

  found_player[:stats]
  # points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15

end

def big_shoe_rebounds
  biggest = 0
  rebounds = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      size = player[:shoe]
      if size > biggest
        biggest = size
        rebounds = player[:rebounds] -1
      end
    end
  end
  rebounds
end


# Bonus

def most_points_scored
  most_points = 0
  mvp = ''
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      points = player[:points]
      if points > most_points
        most_points = points
        mvp = player[:player_name]
      end
    end
  end
  mvp
end

def winning_team
  total_points = 0
  win_team = ''
  game_hash.each do |home_away, keys|
    team_points = 0
    team_name = game_hash[home_away][:team_name]
    keys[:players].each do |player|
      points = player[:points]
      team_points += points
    end
    win_team, total_points = team_name, team_points if team_points > total_points
  end
  return win_team
end

def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].find do |player|
      name_length = player[:player_name].length
      longest, longest_length = player[:player_name], name_length if name_length > longest_length
    end
  end
  return longest
end


# Super Bonus

def long_name_steals_a_ton?
  steals_most = ''
  most_steals = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      steals_most, most_steals = player[:player_name], player[:steals] if player[:steals] > most_steals
    end
  end
  return true if steals_most == player_with_longest_name
end
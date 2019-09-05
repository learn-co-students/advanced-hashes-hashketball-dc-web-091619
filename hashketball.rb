def game_hash
  da_game = {:home => { 
    :team_name => "Brooklyn Nets", 
    :colors => ["Black", "White"],
    :players => [{"Alan Anderson" => {:number => 0,
    :shoe => 16,
    :points => 22,
    :rebounds => 12,
    :assists => 12,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 1}},
    {"Reggie Evans" => {:number => 30,
    :shoe => 14,
    :points => 12,
    :rebounds => 12,
    :assists => 12,
    :steals => 12,
    :blocks => 12,
    :slam_dunks => 7}},
    {"Brook Lopez" => {:number => 11,
    :shoe => 17,
    :points => 17,
    :rebounds => 19,
    :assists => 10,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 15}},
    {"Mason Plumlee" => {:number => 1,
    :shoe => 19,
    :points => 26,
    :rebounds => 11,
    :assists => 6,
    :steals => 3,
    :blocks => 8,
    :slam_dunks => 5}},
    {"Jason Terry" => {:number => 31,
    :shoe => 15,
    :points => 19,
    :rebounds => 2,
    :assists => 2,
    :steals => 4,
    :blocks => 11,
    :slam_dunks => 1}}]
    }, 
  :away => {
    :team_name => "Charlotte Hornets", 
    :colors => ["Turquoise", "Purple"],
    :players => [{"Jeff Adrien" => {:number => 4,
    :shoe => 18,
    :points => 10,
    :rebounds => 1,
    :assists => 1,
    :steals => 2,
    :blocks => 7,
    :slam_dunks => 2}},
    {"Bismack Biyombo" => {:number => 0,
    :shoe => 16,
    :points => 12,
    :rebounds => 4,
    :assists => 7,
    :steals => 22,
    :blocks => 15,
    :slam_dunks => 10}},
    {"DeSagna Diop" => {:number => 2,
    :shoe => 14,
    :points => 24,
    :rebounds => 12,
    :assists => 12,
    :steals => 4,
    :blocks => 5,
    :slam_dunks => 5}},
    {"Ben Gordon" => {:number => 8,
    :shoe => 15,
    :points => 33,
    :rebounds => 3,
    :assists => 2,
    :steals => 1,
    :blocks => 1,
    :slam_dunks => 0}},
    {"Kemba Walker" => {:number => 33,
    :shoe => 15,
    :points => 6,
    :rebounds => 12,
    :assists => 12,
    :steals => 7,
    :blocks => 5,
    :slam_dunks => 12}}]}}
end

def num_points_scored(player)
  game_hash.keys.each{|key|
    game_hash[key][:players].each{|playa|
      if playa.keys.include?(player)
        return playa[player][:points]
      end
      }}
end

def shoe_size(player)
  game_hash.keys.each{|key|
    game_hash[key][:players].each{|playa|
      if playa.keys.include?(player)
        return playa[player][:shoe]
      end
      }}
end

def team_colors(team)
  game_hash.keys.each{|key|
    if game_hash[key][:team_name] == team
      return game_hash[key][:colors]
    end}
end

def team_names
  playing = []
  game_hash.keys.each{|key|
    playing << game_hash[key][:team_name]}
  playing
end

def player_numbers(team)
  numbers = []
  game_hash.keys.each{|key|
    if game_hash[key][:team_name] == team
      game_hash[key][:players].each{|item|
        numbers << item.values[0][:number]}
    end}
  numbers
end

def player_stats(player)
  game_hash.keys.each{|key|
    game_hash[key][:players].each{|playa|
      if playa.keys.include?(player)
        return playa[player]
      end
      }}
end

def big_shoe_rebounds
  boards = {:shoe => 0}
  game_hash.keys.each{|key|
    game_hash[key][:players].each{|item|
    if item.values[0][:shoe] > boards[:shoe]
      boards[:rebounds] = item.values[0][:rebounds]
      boards[:shoe] = item.values[0][:shoe]
    end
      }}
  boards[:rebounds]
end

def most_points_scored
  player = {:points => 0}
  game_hash.keys.each{|key|
    game_hash[key][:players].each{|item|
      if item.values[0][:points] > player[:points]
        player[:points] = item.values[0][:points]
        player[:name] = item.keys[0]
      end}}
  player[:name]
end

def winning_team
  score = {:home => 0, :away => 0}
  game_hash.keys.each{|key|
    game_hash[key][:players].each{|item|
      score[key] += item.values[0][:points]}}
  return game_hash[:home][:team_name] if score[:home] > score[:away]
  game_hash[:away][:team_name]
end

def player_with_longest_name
  score = {:letters => 0, :player => "hello"}
  game_hash.keys.each{|key|
    game_hash[key][:players].each{|item|
      if item.keys[0].length > score[:letters]
        score[:letters] = item.keys[0].length
        score[:player] = item.keys[0]
      end}}
  score[:player]
end

def long_name_steals_a_ton?
  player = player_with_longest_name
  player_steals = 0
  all_steals = []
  game_hash.keys.each{|key|
    game_hash[key][:players].each{|item|    
    all_steals << item.values[0][:steals]
    if item.keys.include?(player)
      player_steals = item.values[0][:steals]
    end}}
  player_steals == all_steals.max
end
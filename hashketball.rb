require "pry"

def game_hash #contains/returns a hash
  {
    :home=>{
      :team_name=>"Brooklyn Nets",
      :colors=>["Black", "White"],
      :players=>[
        {
        :name=>"Alan Anderson", 
        :number=> 0,
        :shoe=>16,
        :points=>22,
        :rebounds=>12,
        :assists=>12,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>1
        },
        {
        :name=>"Reggie Evans",
        :number=>30,
        :shoe=>14,
        :points=>12,
        :rebounds=>12,
        :assists=>12,
        :steals=>12,
        :blocks=>12,
        :slam_dunks=>7
        },
        {
        :name=>"Brook Lopez",
        :number=>11,
        :shoe=>17,
        :points=>17,
        :rebounds=>19,
        :assists=>10,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>15
        },
        {
        :name=>"Mason Plumlee",
        :number=>1,
        :shoe=>19,
        :points=>26,
        :rebounds=>11,
        :assists=>6,
        :steals=>3,
        :blocks=>8,
        :slam_dunks=>5
        },
        {
        :name=>"Jason Terry",
        :number=>31,
        :shoe=>15,
        :points=>19,
        :rebounds=>2,
        :assists=>2,
        :steals=>4,
        :blocks=>11,
        :slam_dunks=>1
        }
      ]
    },
    :away=>{
      :team_name=>"Charlotte Hornets",
      :colors=>["Turquoise","Purple"],
      :players=>[
        {
        :name=>"Jeff Adrien",
        :number=>4,
        :shoe=>18,
        :points=>10,
        :rebounds=>1,
        :assists=>1,
        :steals=>2,
        :blocks=>7,
        :slam_dunks=>2
        },
        {
        :name=>"Bismack Biyombo",
        :number=>0,
        :shoe=>16,
        :points=>12,
        :rebounds=>4,
        :assists=>7,
        :steals=>22,
        :blocks=>15,
        :slam_dunks=>10
        },
        {
        :name=>"DeSagna Diop",
        :number=>2,
        :shoe=>14,
        :points=>24,
        :rebounds=>12,
        :assists=>12,
        :steals=>4,
        :blocks=>5,
        :slam_dunks=>5
        },
        {
        :name=>"Ben Gordon",
        :number=>8,
        :shoe=>15,
        :points=>33,
        :rebounds=>3,
        :assists=>2,
        :steals=>1,
        :blocks=>1,
        :slam_dunks=>0
        },
        {
        :name=>"Kemba Walker",
        :number=>33,
        :shoe=>15,
        :points=>6,
        :rebounds=>12,
        :assists=>12,
        :steals=>7,
        :blocks=>5,
        :slam_dunks=>12
        }
      ]
    }
  }
end


=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end
good_practices
=end


def num_points_scored(name)
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
        if player_info[:name]==name
          return player_info[:points]
        end
    end
  end
end

def shoe_size(name)
   game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
        if player_info[:name]==name
          return player_info[:shoe]
        end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location,team_data|
    if team_data[:team_name]==team_name
      return team_data[:colors]
    end
  end
end

def team_names
  teams_array=[]
  game_hash.each do |location,team_data|
    teams_array.push(team_data[:team_name])
  end
  teams_array
end

def player_numbers(team_name)
  jersey_arr=[]
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if team_name==team_data[:team_name]
        jersey_arr.push(player_info[:number])
      end
    end
  end
  jersey_arr
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

def big_shoe_rebounds
  biggest_shoe=0
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if player_info[:shoe]>biggest_shoe
        biggest_shoe=player_info[:shoe]
      end
    end
    team_data[:players].each do |player_info|
      if player_info[:shoe]==biggest_shoe
        return player_info[:rebounds]
      end
    end
  end
end

#Bonus

def most_points_scored
  most_points=0
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if player_info[:points]>most_points
        most_points=player_info[:points]
      end
    end
  end
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if most_points==player_info[:points]
        return player_info[:name]
      end
    end
  end
end

def winning_team
  total=0
  totals=[]
  game_hash.each do |location,team_data|
    team_data[:players].reduce(0) do |sum,values|
      sum=sum+values[:points]
      total=sum
    end
  #  team_data[:players].each do |player_info|
  #    total+=player_info[:points]
  #  end
    totals << total
    #two points totals show up here....
  end
  if totals[0]>totals[1]
     game_hash[:home][:team_name]
  elsif totals[0]<totals[1]
    game_hash[:away][:team_name]
  end
  
end

def player_with_longest_name
  longest_name_length = 0
  longest_name = 0
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if player_info[:name].length > longest_name_length
        longest_name_length=player_info[:name].length
      end
    end
  end
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if player_info[:name].length==longest_name_length
        return player_info[:name]
      end
    end
  end
end

#Super Bonus
def long_name_steals_a_ton?
  most_steals=0
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if player_info[:steals]>most_steals
        most_steals=player_info[:steals]
      end
    end
  end
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      if most_steals==player_info[:steals] && player_info[:name] == player_with_longest_name
         return TRUE
      end  
  end
end
end

require 'pry'


def game_hash
  hash_stats = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        }, {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        }, {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        }, {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        }, {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }]
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        }, {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        }, {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        }, {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        }, {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
        }]
      }
    }
  return hash_stats
end 

def num_points_scored(player)
  hash_look = game_hash
  inner_hash_home = hash_look[:home][:players]
  inner_hash_away = hash_look[:away][:players]
  
  i = 0 
  while i < inner_hash_home.length do 
    if inner_hash_home[i][:player_name] == player
      return inner_hash_home[i][:points]
    end
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    if inner_hash_away[k][:player_name] == player
      return inner_hash_away[k][:points]
    end
    k += 1
  end
end

def shoe_size(player)
  hash_look = game_hash
  inner_hash_home = hash_look[:home][:players]
  inner_hash_away = hash_look[:away][:players]
  
  i = 0 
  while i < inner_hash_home.length do 
    if inner_hash_home[i][:player_name] == player
      return inner_hash_home[i][:shoe]
    end
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    if inner_hash_away[k][:player_name] == player
      return inner_hash_away[k][:shoe]
    end
    k += 1
  end
end

def team_colors(team)
  hash_look = game_hash
  array = []
  if hash_look[:home][:team_name] == team 
    array = hash_look[:home][:colors]
  elsif hash_look[:away][:team_name] == team 
    array = hash_look[:away][:colors]
  end
  return array
end 

def team_names
  teams = [game_hash[:home][:team_name],  game_hash[:away][:team_name]]
  return teams
end

def player_numbers(team)
  hash_look = game_hash
  array = []
  if hash_look[:home][:team_name] == team 
    i = 0 
    while i < hash_look[:home][:players].length do 
      array << hash_look[:home][:players][i][:number]
      i += 1
    end
  elsif hash_look[:away][:team_name] == team 
    i = 0 
    while i < hash_look[:away][:players].length do 
      array << hash_look[:away][:players][i][:number]
      i += 1
    end
  end
  return array
end

def player_stats(player)
  hash_look = game_hash
  inner_hash_home = hash_look[:home][:players]
  inner_hash_away = hash_look[:away][:players]
  
  
  i = 0 
  while i < inner_hash_home.length do 
    if inner_hash_home[i][:player_name] == player
      stat_hash = {
        :number => inner_hash_home[i][:number],
        :shoe => inner_hash_home[i][:shoe],
        :points => inner_hash_home[i][:points],
        :rebounds => inner_hash_home[i][:rebounds],
        :assists => inner_hash_home[i][:assists],
        :steals => inner_hash_home[i][:steals],
        :blocks => inner_hash_home[i][:blocks],
        :slam_dunks => inner_hash_home[i][:slam_dunks]
      }
      return stat_hash
    end
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    if inner_hash_away[k][:player_name] == player
      stat_hash = {
        :number => inner_hash_away[k][:number],
        :shoe => inner_hash_away[k][:shoe],
        :points => inner_hash_away[k][:points],
        :rebounds => inner_hash_away[k][:rebounds],
        :assists => inner_hash_away[k][:assists],
        :steals => inner_hash_away[k][:steals],
        :blocks => inner_hash_away[k][:blocks],
        :slam_dunks => inner_hash_away[k][:slam_dunks]
      }
      return stat_hash
    end
    k += 1
  end
end

def big_shoe_rebounds
  hash_look = game_hash
  inner_hash_home = hash_look[:home][:players]
  inner_hash_away = hash_look[:away][:players]
  
  shoe_size = 0 
  rebounds = 0 
  
  i = 0 
  while i < inner_hash_home.length do 
    if (shoe_size < inner_hash_home[i][:shoe])
      shoe_size = inner_hash_home[i][:shoe]
      rebounds = inner_hash_home[i][:rebounds]
    end
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    if (shoe_size < inner_hash_away[k][:shoe]) 
      shoe_size = inner_hash_away[k][:shoe]
      rebounds = inner_hash_away[k][:rebounds]
    end
    k += 1
  end
  
  return rebounds
end

def most_points_scored
  hash_look = game_hash
  inner_hash_home = hash_look[:home][:players]
  inner_hash_away = hash_look[:away][:players]
  
  points_scored = 0 
  name = " "
  
  i = 0 
  while i < inner_hash_home.length do 
    if (points_scored < inner_hash_home[i][:points])
      points_scored = inner_hash_home[i][:points]
      name = inner_hash_home[i][:player_name]
    end
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    if (points_scored < inner_hash_away[k][:points])
      points_scored = inner_hash_away[k][:points]
      name = inner_hash_away[k][:player_name]
    end
    k += 1
  end
  
  return name
end 

def winning_team
  hash_look = game_hash
  inner_hash_home = hash_look[:home][:players]
  inner_hash_away = hash_look[:away][:players]
  
  home_points = 0 
  away_points = 0 
  
  i = 0 
  while i < inner_hash_home.length do 
    home_points += inner_hash_home[i][:points]
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    away_points += inner_hash_away[k][:points]
    k += 1
  end
  
  if away_points < home_points
    return hash_look[:home][:team_name]
  elsif home_points < away_points
    return hash_look[:away][:team_name]
  end
end 

def player_with_longest_name
  hash_look = game_hash
  inner_hash_home = hash_look[:home][:players]
  inner_hash_away = hash_look[:away][:players]
  
  name_length = 0 
  name = " "
  
  i = 0 
  while i < inner_hash_home.length do 
    if (name_length < inner_hash_home[i][:player_name].length)
      name_length = inner_hash_home[i][:player_name].length
      name = inner_hash_home[i][:player_name]
    end
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    if (name_length < inner_hash_away[k][:player_name].length)
      name_length = inner_hash_away[k][:player_name].length
      name = inner_hash_away[k][:player_name]
    end
    k += 1
  end
  
  return name
end

def long_name_steals_a_ton?
  hash_look = game_hash
  inner_hash_home = hash_look[:home][:players]
  inner_hash_away = hash_look[:away][:players]
  
  name_length = 0 
  name = " "
  long_name_steals = 0
  
  i = 0 
  while i < inner_hash_home.length do 
    if (name_length < inner_hash_home[i][:player_name].length)
      name_length = inner_hash_home[i][:player_name].length
      name = inner_hash_home[i][:player_name]
      long_name_steals = inner_hash_home[i][:steals]
    end
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    if (name_length < inner_hash_away[k][:player_name].length)
      name_length = inner_hash_away[k][:player_name].length
      name = inner_hash_away[k][:player_name]
      long_name_steals = inner_hash_away[k][:steals]
    end
    k += 1
  end
  
  
  
  steals = 0 
  name_2 = " "
  
  i = 0 
  while i < inner_hash_home.length do 
    if (steals < inner_hash_home[i][:steals])
      steals = inner_hash_home[i][:steals]
      name_2 = inner_hash_home[i][:player_name]
    end
    i += 1
  end
  
  k = 0 
  while k < inner_hash_away.length do 
    if (steals < inner_hash_away[k][:steals])
      steals = inner_hash_away[k][:steals]
      name_2 = inner_hash_away[k][:player_name]
    end
    k += 1
  end
  
  if name == name_2 
    return true 
  else
    return false
  end
end






# Write your code here!
require 'pry'

def game_hash
  
  hash = {
    
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7 
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5 
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2 
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5 
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0 
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12 
        }
      ]
    }
    
  }
  
end

def num_points_scored(player)
  
  counter = 0
  
  points = 0
  
  while counter < game_hash[:home][:players].length do
    if player == game_hash[:home][:players][counter][:player_name]
      points = game_hash[:home][:players][counter][:points]
    end
    if player == game_hash[:away][:players][counter][:player_name]
      points = game_hash[:away][:players][counter][:points]
    end
    counter += 1
  end
  
  points
  
end


def shoe_size(player)
  
  counter = 0
  
  shoe = 0
  
  while counter < game_hash[:home][:players].length do
    if player == game_hash[:home][:players][counter][:player_name]
      shoe = game_hash[:home][:players][counter][:shoe]
    end
    if player == game_hash[:away][:players][counter][:player_name]
      shoe = game_hash[:away][:players][counter][:shoe]
    end
    counter += 1
  end
  
  shoe
end


def team_colors(team)
  
  game_hash.each do |teams, info|
    info.each do |stats, details|
      # binding.pry
      if team == details
        return info[:colors]
      end
    end
  end
end


def team_names
  team_array = []
  game_hash.each do |teams, info|
    info.each do |stats, details|
      if stats == :team_name
        team_array.push(info[stats])
      end
    end
  end
  team_array
end


def player_numbers(team)
  numbers_array = []
  counter = 0
  
  if team == "Brooklyn Nets"
    while counter < game_hash[:home][:players].length do
      numbers_array << game_hash[:home][:players][counter][:number]
      counter += 1
    end
  end
  
  if team == "Charlotte Hornets"
    while counter < game_hash[:away][:players].length do
      numbers_array << game_hash[:away][:players][counter][:number]
      counter += 1
    end
  end
  
  numbers_array
  
end


def player_stats(player)
  stats_hash = {}
  game_hash.each do |teams, info|
    info.each do |stats, details|
      counter = 0
      while counter < info[:players].length
        if info[:players][counter][:player_name] == player
          stats_hash[:number] = info[:players][counter][:number]
          stats_hash[:shoe] = info[:players][counter][:shoe]
          stats_hash[:points] = info[:players][counter][:points]
          stats_hash[:rebounds] = info[:players][counter][:rebounds]
          stats_hash[:assists] = info[:players][counter][:assists]
          stats_hash[:steals] = info[:players][counter][:steals]
          stats_hash[:blocks] = info[:players][counter][:blocks]
          stats_hash[:slam_dunks] = info[:players][counter][:slam_dunks]
        end
        counter += 1
      end
    end
  end
  stats_hash
end


def big_shoe_rebounds
  
  largest_shoes = 0
  
  game_hash.each do |teams, info|
    info.each do |stats, details|
      counter = 0
      while counter < info[:players].length
        if info[:players][counter][:shoe] > largest_shoes
          largest_shoes = info[:players][counter][:shoe]
        end
        counter += 1
      end
      count = 0
      while count < info[:players].length
        if largest_shoes == info[:players][count][:shoe]
          return info[:players][count][:rebounds]
        end
        count += 1
      end
    end
  end
end



def most_points_scored
  most_points = 0
  counter = 0
  
  while counter < game_hash[:home][:players].length do
    if game_hash[:home][:players][counter][:points] > most_points
      most_points = game_hash[:home][:players][counter][:points]
    end
    if game_hash[:away][:players][counter][:points] > most_points
      most_points = game_hash[:away][:players][counter][:points]
    end
    counter += 1
  end
  
  count = 0
  
  while count < game_hash[:home][:players].length do
    if most_points == game_hash[:home][:players][count][:points]
      return game_hash[:home][:players][count][:player_name]
    end
    if most_points == game_hash[:away][:players][count][:points]
      return game_hash[:away][:players][count][:player_name]
    end
    count += 1
  end
  
  # game_hash.each do |teams, info|
  #   info.each do |stats, details|
  #     binding.pry
  #     counter = 0
  #     while counter < info[:players].length do
  #       if info[:players][counter][:points] > most_points
  #         most_points = info[:players][counter][:points]
  #       end
  #       counter += 1
  #     end
  #     count = 0
  #     while count < info[:players].length
  #       if most_points == info[:players][count][:points]
  #         return info[:players][count][:player_name]
  #       end
  #       count += 1
  #     end
  #   end
    
  # end
  

end


def winning_team
  nets_points = 0
  hornets_points = 0
  
  counter = 0
  
  while counter < game_hash[:home][:players].length do
    nets_points += game_hash[:home][:players][counter][:points]
    hornets_points += game_hash[:away][:players][counter][:points]
    counter += 1
  end
  
  if nets_points > hornets_points
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
  
end


def player_with_longest_name
  longest_name = 0
  counter = 0
  
  while counter < game_hash[:home][:players].length do
    if game_hash[:home][:players][counter][:player_name].length > longest_name
      longest_name = game_hash[:home][:players][counter][:player_name].length
    end
    if game_hash[:away][:players][counter][:player_name].length > longest_name
      longest_name = game_hash[:away][:players][counter][:player_name].length
    end
    counter += 1
  end
  
  count = 0
  
  while count < game_hash[:home][:players].length do
    if longest_name == game_hash[:home][:players][count][:player_name].length
      return game_hash[:home][:players][count][:player_name]
    end
    if longest_name == game_hash[:away][:players][count][:player_name].length
      return game_hash[:away][:players][count][:player_name]
    end
    count += 1
  end
  
end


def long_name_steals_a_ton?
  most_steals = 0
  counter = 0
  
  while counter < game_hash[:home][:players].length do
    if game_hash[:home][:players][counter][:steals] > most_steals
      most_steals = game_hash[:home][:players][counter][:steals]
    end
    if game_hash[:away][:players][counter][:steals] > most_steals
      most_steals = game_hash[:away][:players][counter][:steals]
    end
    counter += 1
  end
  
  count = 0
  
  while count < game_hash[:home][:players].length do
    if most_steals == game_hash[:home][:players][count][:steals] && game_hash[:home][:players][count][:player_name] == player_with_longest_name
      return true
    end
    if most_steals == game_hash[:away][:players][count][:steals] && game_hash[:away][:players][count][:player_name] == player_with_longest_name
      return true
    end
    count += 1
  end
  return false
end


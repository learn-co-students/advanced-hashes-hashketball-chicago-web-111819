require "pry"

def game_hash
  game_hash = { 
    home: { 
      team_name: "Brooklyn Nets",
      colors: [ "Black", "White" ],
      players: [ 
        "Alan Anderson" => { 
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
      },
        "Reggie Evans" => { 
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
      },
      "Brook Lopez" => { 
          number: 11,
          shoe: 17,
          points: 17,
          rebounds:19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
      },
      "Mason Plumlee" => { 
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
      },
      "Jason Terry" => { 
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
      }]
    },
    away: { 
      team_name: "Charlotte Hornets",
      colors: [ "Turquoise", "Purple" ],
      players: [ 
        "Jeff Adrien" => { 
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo" => { 
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => { 
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => { 
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Kemba Walker" => { 
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
          }]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        return stats[:points] if player_name == name 
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        return stats[:shoe] if player_name == name 
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == name 
  end
end

def team_names
  team_names = []
  game_hash.each do |location,team_data|
    team_names.push(team_data[:team_name])
  end
  team_names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player_hash|
        player_hash.each do |player_name, stats|
          numbers.push(stats[:number])
        end
      end
    end
  end
  numbers
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        return stats if player_name == player
      end
    end
  end
end

def big_shoe_rebounds
  
  biggest_shoe = 0
  rebounds = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        if stats[:shoe] > biggest_shoe
          biggest_shoe = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  
  counter = 0
  player_most_points = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        if stats[:points] > counter
          counter = stats[:points]
          player_most_points = player_name
        end
      end
    end
  end
  player_most_points  
end

def winning_team
  
  home_score = 0
  away_score = 0
  
   game_hash[:home][:players].each do |player_hash|
     player_hash.each do |player_name, stats|
      home_score += stats[:points]
    end
  end
  
   game_hash[:away][:players].each do |player_hash|
     player_hash.each do |player_name, stats|
      away_score += stats[:points]
    end
  end  
  
  if home_score > away_score
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name

  longest_name = ""
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        if "#{player_name}".length > "#{longest_name}".length
          longest_name = player_name
          end
        end
      end
    end
  return longest_name
end

def long_name_steals_a_ton?
  
  steals_counter = 0
  player_with_most_steals = ""
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |name, stats|
        if player_hash[name][:steals] > steals_counter
          steals_counter = player_hash[name][:steals]
          player_with_most_steals = name
        end
      end
    end
  end
  return player_with_most_steals == player_with_longest_name
end 
















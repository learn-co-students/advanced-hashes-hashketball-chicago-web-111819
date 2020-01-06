def game_hash
  
  {
    :home=> {
      :team_name=> "Brooklyn Nets",
      :colors=> ["Black", "White"],
      :players=> [
        {:player_name=>"Alan Anderson",
        :number=>0,
        :shoe=>16,
        :points=>22,
        :rebounds=>12,
        :assists=>12,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>1 },
        {:player_name=>"Reggie Evans",
        :number=>30,
        :shoe=>14,
        :points=>12,
        :rebounds=>12,
        :assists=>12,
        :steals=>12,
        :blocks=>12,
        :slam_dunks=>7 },
        {:player_name=>"Brook Lopez",
        :number=>11,
        :shoe=>17,
        :points=>17,
        :rebounds=>19,
        :assists=>10,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>15 },
        {:player_name=>"Mason Plumlee",
        :number=>1,
        :shoe=>19,
        :points=>26,
        :rebounds=>11,
        :assists=>6,
        :steals=>3,
        :blocks=>8,
        :slam_dunks=>5 },
        {:player_name=>"Jason Terry",
        :number=>31,
        :shoe=>15,
        :points=>19,
        :rebounds=>2,
        :assists=>2,
        :steals=>4,
        :blocks=>11,
        :slam_dunks=>1 }
        ]
      }, 
    :away=> {
      :team_name=> "Charlotte Hornets",
      :colors=> ["Turquoise", "Purple"],
      :players=>[
        {:player_name=>"Jeff Adrien",
        :number=>4,
        :shoe=>18,
        :points=>10,
        :rebounds=>1,
        :assists=>1,
        :steals=>2,
        :blocks=>7,
        :slam_dunks=>2 },
        {:player_name=>"Bismack Biyombo",
        :number=>0,
        :shoe=>16,
        :points=>12,
        :rebounds=>4,
        :assists=>7,
        :steals=>22,
        :blocks=>15,
        :slam_dunks=>10 },
        {:player_name=>"DeSagna Diop",
        :number=>2,
        :shoe=>14,
        :points=>24,
        :rebounds=>12,
        :assists=>12,
        :steals=>4,
        :blocks=>5,
        :slam_dunks=>5 },
        {:player_name=>"Ben Gordon",
        :number=>8,
        :shoe=>15,
        :points=>33,
        :rebounds=>3,
        :assists=>2,
        :steals=>1,
        :blocks=>1,
        :slam_dunks=>0 },
        {:player_name=>"Kemba Walker",
        :number=>33,
        :shoe=>15,
        :points=>6,
        :rebounds=>12,
        :assists=>12,
        :steals=>7,
        :blocks=>5,
        :slam_dunks=>12 }
        ]
      }
  }
end

def search_players_stat_by_name(name,stat_sym)
  game_hash[:home][:players].each { |i|
    if i[:player_name] == name 
      return i[stat_sym]
    else
    end
    }
  
  game_hash[:away][:players].each { |i|
    if i[:player_name] == name
      return i[stat_sym]
    else
    end
    }
    
end

def all_players
  player_array = []
  player_array = game_hash[:away][:players] + game_hash[:home][:players]
end

def team_info(team,stat)
  game_hash.each { |k,v| 
    if v[:team_name] == team
      return v[stat]
    else
    end
  }
end

def num_points_scored(name)
  search_players_stat_by_name(name,:points)
end

def shoe_size(name)
  search_players_stat_by_name(name,:shoe)
end
  
def team_colors(team)
  team_info(team,:colors)
end

def team_names
  game_hash.map { |k,v| 
  v[:team_name] }
end

def player_numbers(team)
  team_info(team,:players).map { |i| i[:number] }
end

def player_stats(name)
  stats = Hash.new
  game_hash[:home][:players].each { |i|
    if i[:player_name] == name 
      stats = i
    else
    end
    }
  
  game_hash[:away][:players].each { |i|
    if i[:player_name] == name
      stats = i
    else
    end
    }
  stats.delete(:player_name)
  
  stats
end

def big_shoe_rebounds
  player = all_players.max_by { |i| i[:shoe] }
  player[:rebounds]
end

def most_points_scored
  player = all_players.max_by { |i| i[:points] }
  player[:player_name]
end

def winning_team
  home_total = 0
  away_total = 0
  game_hash[:home][:players].each { |i|  home_total += i[:points] }
  
  game_hash[:away][:players].each { |i|  away_total += i[:points] }
    
  if home_total > away_total
    return game_hash[:home][:team_name]
  elsif home_total < away_total
    return game_hash[:away][:team_name]
  else
    return "it's a tie!"
  end
    
end

def player_with_longest_name
  player = all_players.max_by { |i| i[:player_name].length }
  player[:player_name]
end

def long_name_steals_a_ton?
  player = all_players.max_by { |i| i[:steals] }
  player[:player_name] == player_with_longest_name
end
  
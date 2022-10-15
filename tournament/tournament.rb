class Tournament
  class Error < StandardError; end

  POINTS = {win: 3, draw: 1}.freeze
  HEADER = 
  
  def self.tally(input)
    new(input).tally
  end

  def initialize(input)
    @games = retreive_game_info(input)
    @teams = []
  end

  def tally
    return StatsFormatter.header if no_games?
    
    process_games

    StatsFormatter.format(@teams.sort)
  end

  private

  def create_team(team_name)
    team = Team.new(team_name, 0, 0, 0, 0, 0)
    @teams << team
    team
  end

  def no_games?
    @games.size == 1 && @games.first.empty?
  end

  def process_games
    @games.each do |game|
      team_1_name, team_2_name, result = game
      team_1 = retrieve_or_create_team(team_1_name)
      team_2 = retrieve_or_create_team(team_2_name)
      
      case result
      when "win"
        team_1.won
        team_2.lost
      when "draw"
        [team_1, team_2].each(&:ties)
      when "loss"
        team_1.lost
        team_2.won
      else
        raise Error, "Invalid game result provided"
      end
    end
  end

  def retreive_game_info(input)
    input.each_line.map(&:chomp).map { _1.split(";") }
  end

  def retrieve_or_create_team(team_name)
    team_exist?(team_name) ? team_from(team_name) : create_team(team_name)
  end

  def team_exist?(team_name)
    @teams.any? { _1.name == team_name }
  end

  def team_from(team_name)
    @teams.select { _1.name == team_name }.first
  end
  
  class Team
    include Comparable

    attr_accessor :name, :played, :wins, :losses, :draws, :points
    
    def initialize(name, played, wins, losses, draws, points)
      @name = name
      @played = played
      @wins = wins
      @losses = losses
      @draws = draws
      @points = points
    end

    def <=>(other)
      if points != other.points
        other.points <=> points 
      else
        name <=> other.name 
      end
    end

    def won
      self.played += 1
      self.wins += 1
      self.points += POINTS[:win]
    end

    def lost
      self.played += 1
      self.losses += 1
    end

    def ties
      self.played += 1
      self.draws += 1
      self.points += POINTS[:draw]
    end
  end

  class StatsFormatter
    def self.format(teams)
      new(teams).format
    end

    def self.header
      output = "Team".ljust(31)
      output << "| MP |  W |  D |  L |  P\n"
    end

    def initialize(teams)
      @teams = teams
    end

    def format
      output = self.class.header
      @teams.each do |team|
        output << team.name.ljust(31)
        output << "|  #{team.played} |  #{team.wins} |  #{team.draws} |  #{team.losses} |  #{team.points}\n"
      end
      output
    end
  end
end
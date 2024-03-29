# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  PRICES = {regular: 15, senior: 10}.freeze

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age < 60 ? PRICES[:regular] : PRICES[:senior]    
  end

  def watch_scary_movie?
    @age >= 18
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise NotMovieClubMemberError unless @member
    "🍿" 
  end
end

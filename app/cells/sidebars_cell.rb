class SidebarsCell < Cell::Rails
  cache :recent_commodities, :expires_in => 1.hours
  cache :recent_comments, :expires_in => 30.minutes

  def recent_commodities
    @commodities = Commodity.recent.opening.limit(9)
    render
  end

  def recent_comments
    @comments = Comment.recent.limit(10)
    render
  end

end

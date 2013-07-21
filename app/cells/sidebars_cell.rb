class SidebarsCell < Cell::Rails
  helper ApplicationHelper
  cache :recent_commodities, :expires_in => 1.hours
  cache :recent_comments, :expires_in => 30.minutes
  cache :listen, :expires_in => 6.hours
  cache :trader, :expires_in => 6.hours do |cell, options|
    "#{options[:trader].id}_#{options[:trader].updated_at.to_i}"
  end

  def recent_commodities
    @commodities = Commodity.recent.opening.limit(9)
    render
  end

  def recent_comments
    @comments = Comment.recent.limit(10)
    render
  end

  def listen
    render
  end

  def trader(args)
    @commodity = args[:commodity]
    @trader = args[:trader]
    render
  end

end

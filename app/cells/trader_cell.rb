class TraderCell < Cell::Rails

  def nav(args)
    @parent = args[:parent]
    @c = args[:c]
    @a = args[:a]
    render
  end

end

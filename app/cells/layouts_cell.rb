class LayoutsCell < Cell::Rails
  cache :footer, :expires_in => 1.day

  def footer
    render
  end

end

class NotificationCell < Cell::Rails
  helper ApplicationHelper

  def chat(args)
    @notification = args[:notification]
    render
  end

end

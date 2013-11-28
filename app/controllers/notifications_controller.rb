class NotificationsController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :all,except: [:edit,:update,:new,:create]

  skip_load_and_authorize_resource only: :index

  def show
    show! do 
      @notification.read!
    end
  end

  def read
    @notifications = current_user.notifications.read.recent.page params[:page]
  end

  def destroy
    destroy! do |f|
      f.js
      f.html{redirect_to :back}
    end
  end

  #def accept
    #@notification = current_user.notifications.find(params[:id])
    #@notification.accept!
    #if request.xhr?
      #render :remove_notification
    #else
      #redirect_to :back
    #end

  #end

  #def deny
    #@notification = current_user.notifications.find(params[:id])
    #@notification.deny!
    #if request.xhr?
      #render :remove_notification
    #else
      #redirect_to :back
    #end
  #end

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @notifications ||= end_of_association_chain.recent.unread.page params[:page]
  end
end


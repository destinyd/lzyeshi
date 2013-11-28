class User::MpUsersController < InheritedResources::Base
  layout 'left_nav'
  before_filter :authenticate_user!
  actions :destroy
  
  def index
    @mp_users = current_user.mp_users
    unless @mp_users.any?
      redirect_to new_mp_user_path
    end
  end

  def new
    @mp_user = current_user.mp_users.new
  end

  def create
    @mp_user = MpUser.where(shortOpenID: params[:mp_user][:shortOpenID]).first
    if @mp_user 
      @mp_user.user = current_user
      @mp_user.save
      redirect_to mp_users_path
    else
      flash[:error] = '未找到此绑定码'
      redirect_to new_mp_user_path
    end
  end

  protected
  def begin_of_association_chain
    current_user
  end

end

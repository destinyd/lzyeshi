class Trader::ContactsController < InheritedResources::Base
  layout 'left_nav'
  defaults resource_class: Contact::Base
  actions :all, except: [:show]
  load_and_authorize_resource except: :index
  skip_load_and_authorize_resource :only => :index
  def create
    @contact = 
      case params[:contact][:_type]
      when 'Contact::Base'
        Contact::Base.new params[:contact]
      when 'Contact::Picture'
        Contact::Picture.new params[:contact]
      when 'Contact::Link'
        Contact::Link.new params[:contact]
      end

    respond_to do |format|
      @contact.user = current_user
      if @contact.save
        format.html  { redirect_to(contacts_path,
                                   notice: '联系方式创建成功.') }
      else
        format.html  { render action: :new }
      end
    end
  end

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @contacts ||= end_of_association_chain.accessible_by(current_ability).page params[:page]
  end
end

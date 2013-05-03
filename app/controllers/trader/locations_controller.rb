class Trader::LocationsController < InheritedResources::Base
  layout 'trader'
  actions :all, except: [:edit, :update]
  respond_to :json
  respond_to :js, only: [:index]

  def destroy
    destroy!{locations_path}
  end

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @locations ||= end_of_association_chain.recent.page params[:page]
  end
end

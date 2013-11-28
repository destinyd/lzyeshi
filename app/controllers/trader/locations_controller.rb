class Trader::LocationsController < InheritedResources::Base
  layout 'left_nav'
  actions :all, except: [:edit, :update]
  respond_to :json
  respond_to :js, only: [:index, :create]

  def create
    create! do |success,failure|
      success.js{render :create}
      failure.js{render :failure}
    end
  end

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

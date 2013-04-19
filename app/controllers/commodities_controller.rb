class CommoditiesController < InheritedResources::Base
  actions :index, :show
  respond_to :json
  belongs_to :group, optional: true
  belongs_to :trader, optional: true

  def index
    index! do |f|
      f.html
      f.json{
        render json: @commodities
      }
    end
  end

  protected
  def collection
    @commodities ||= end_of_association_chain.opening.recent.page params[:page]
  end
end

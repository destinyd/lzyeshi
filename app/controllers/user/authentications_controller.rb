class User::AuthenticationsController < InheritedResources::Base
  layout 'left_nav'
  actions :index, :update
  load_and_authorize_resource :authentication

  def update
    update!{authentications_path}
  end
  protected
  def begin_of_association_chain
    current_user
  end
end

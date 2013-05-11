module Api::V1
  class ApiController < ::ApplicationController
    skip_filter :verify_authenticity_token
    respond_to :json

    private
    def current_resource_owner
      #current_user || warden.authenticate!(:scope => :user)
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end

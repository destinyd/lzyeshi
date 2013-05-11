module Api::V1
  class CredentialsController < ApiController
    doorkeeper_for :all

    def me
      respond_with current_resource_owner
    end
  end
end

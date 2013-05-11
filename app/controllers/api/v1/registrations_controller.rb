module Api::V1
  class RegistrationsController < ApiController
    def create
      @user = User.new(params[:user])
      if @user.save
        @access_token = Doorkeeper::AccessToken.create!({
          :application_id     => Doorkeeper::Application.first.id,
          :resource_owner_id  => @user.id,
          :expires_in         => nil,
          :use_refresh_token  => true
        })
        render json: {
          access_token:@access_token.token,
          token_type: 'bearer',
          expires_in: nil,
          refresh_token: @access_token.refresh_token,
          scope: ''
        }, :status=>201
      else
        warden.custom_failure!
        render :json=> @user.errors, :status=>422
      end
    end

    def test
      @user = User.create_phone_test
      @access_token = Doorkeeper::AccessToken.create!({
        :application_id     => Doorkeeper::Application.first.id,
        :resource_owner_id  => @user.id,
        #:scopes             => '',
        :expires_in         => nil,
        :use_refresh_token  => true
      })
      render json: {
        access_token:@access_token.token,
        token_type: 'bearer',
        expires_in: nil,
        refresh_token: @access_token.refresh_token,
        scope: '',
        email: @user.email
      }, :status=>201
      #if @user = User.create_phone_test
      #render :json=> @user#, :status=>201
      #else
      ##warden.custom_failure!
      #render :json=> @user.errors, :status=>422
      #end
    end

  end
end

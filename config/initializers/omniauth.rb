OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :baidu, 'hEokp6EZ9V1WbTjQjG0myMOp', 'KaSu5aUmj5nQHGwW3DiUtBEZTlol3GKG'
end

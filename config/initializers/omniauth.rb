Rails.application.config.middleware.use OmniAuth::Builder do
  ras = Rails.application.secrets
  provider :twitter, ras.twitter_api_key, ras.twitter_api_sectet
end

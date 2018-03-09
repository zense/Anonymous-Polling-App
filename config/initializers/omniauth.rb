OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1000940372550-vro2o2evede3cjmjm9ni39bls23hn3m9.apps.googleusercontent.com', 'Fa7i3eSuTjpropiuuYPnn2PC', { :skip_jwt => true }
end

OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '210285683926-180cmt6demnastaked3llabm2ro5uf2g.apps.googleusercontent.com', 'RHYzR-VAF_yzngpzCsUMQOdt', { :skip_jwt => true }
end

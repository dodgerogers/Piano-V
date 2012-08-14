OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '123858854427503', '2dac7ebd85f62f31403322ac4331600d',
  scope: "publish_stream, email, user_photos", iframe: true , authorize_params: { display: "popup" }
end
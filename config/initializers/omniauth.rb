Rails.application.config.middleware.use OmniAuth::Builder do

  #WHEN APP LOADS ALL THE INITIALIZERS ARE SET FOR OMNIAUTH SERVICES
  
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']

end
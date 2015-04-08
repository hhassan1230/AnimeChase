Rails.application.config.middleware.use OmniAuth::Builder do
  #WHEN APP LOADS ALL THE INITIALIZERS ARE SET FOR OMNIAUTH SERVICES
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET']
  # :scope => 'email,user_birthday,read_stream', :display => 'popup'
end